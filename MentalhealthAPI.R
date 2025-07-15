
# STEP 9: Wrap with Vetiver

v <- vetiver_model(burnout_fit, "mentalhealthpred")



# STEP 10: Pin Model

b <- board_folder("my-pins")
b %>% vetiver_pin_write(v)


vetiver_write_plumber(b, "mentalhealthpred", rsconnect = FALSE)
vetiver_write_docker(v)


# STEP 11: Serve API Locally

pr() %>%
  vetiver_api(burnout_vetiver) %>%
  pr_run(port = 8000)