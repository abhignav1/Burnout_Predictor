# STEP 1: Load Libraries

library(tidyverse)
library(tidymodels)
library(vetiver)
library(pins)
library(plumber)

# STEP 2: Load & Engineer Data

data <- read_csv("C:/Users/av1265/Downloads/digital_diet_mental_health.csv")

data <- data %>%
  mutate(
    screen_per_hour_awake = daily_screen_time_hours / (24 - sleep_duration_hours),
    stress_to_sleep_ratio = stress_level / (sleep_duration_hours + 1),
    screen_stress_ratio = daily_screen_time_hours / (stress_level + 1),
    caffeine_sleep_ratio = caffeine_intake_mg_per_day / (sleep_duration_hours + 1),
    digital_exhaustion = (daily_screen_time_hours + phone_usage_hours) * stress_level / (sleep_duration_hours + 1),
    wellbeing_score = mindfulness_minutes_per_day + physical_activity_hours_per_week - caffeine_intake_mg_per_day,
    stress_x_screen = stress_level * daily_screen_time_hours
  ) %>%
  select(-user_id)


# STEP 3: Filter Labels

filtered <- data %>%
  filter(mental_health_score < 50 | mental_health_score >= 70) %>%
  mutate(burnout_class = ifelse(mental_health_score < 50, "burnout", "healthy")) %>%
  select(-mental_health_score)


# STEP 4: Split into Train/Test

set.seed(42)
split <- initial_split(filtered, prop = 0.8, strata = burnout_class)
train <- training(split)
test <- testing(split)


# STEP 5: Create Recipe

burnout_recipe <- recipe(burnout_class ~ ., data = train) %>%
  step_zv(all_predictors()) %>%
  step_novel(all_nominal_predictors()) %>%
  step_dummy(all_nominal_predictors()) %>%
  step_normalize(all_numeric_predictors())

# STEP 6: Define XGBoost Model

xgb_spec <- boost_tree(
  trees = 300,
  tree_depth = 4,
  learn_rate = 0.05
) %>%
  set_engine("xgboost") %>%
  set_mode("classification")


#  STEP 7: Workflow & Fit Model

burnout_wflow <- workflow() %>%
  add_recipe(burnout_recipe) %>%
  add_model(xgb_spec)

burnout_fit <- fit(burnout_wflow, data = train)


#  STEP 8: Evaluate Accuracy

predictions <- predict(burnout_fit, new_data = test) %>%
  bind_cols(test %>% select(burnout_class))

predictions <- predictions %>%
  mutate(
    burnout_class = factor(burnout_class),
    .pred_class = factor(.pred_class, levels = levels(burnout_class))
  )

print(conf_mat(predictions, truth = burnout_class, estimate = .pred_class))
print(accuracy(predictions, truth = burnout_class, estimate = .pred_class))





