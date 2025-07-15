# Burnout_Predictor
# 🧠 Burnout Risk Prediction Using Digital Lifestyle Data

**📌 Overview**

In our hyper-connected world, burnout has become a silent epidemic. This project predicts burnout risk by analyzing digital habits, sleep patterns, and lifestyle behaviors using machine learning. Instead of waiting for burnout to manifest, we can identify at-risk individuals early and intervene proactively.

The model uses **XGBoost regression** to predict mental health scores and classifies users as either "Burnout Risk" or "Healthy" based on their digital behavior patterns.

## 🎯 Project Objectives

- **Predict burnout risk** using everyday digital behavior data
- **Early intervention** for mental wellness and workplace productivity  
- **Explore real-world applications** for HR tools, wellness apps, and digital self-care
- **Provide actionable insights** rather than just classifications

## 📚 Dataset Details

**Title:** Digital Diet & Mental Health Impact  
**Size:** ~2,000 user observations  
**Features Include:**
- `daily_screen_time_hours`, `phone_usage_hours`, `social_media_hours`
- `sleep_duration_hours`, `sleep_quality`, `stress_level` 
- `physical_activity_hours_per_week`, `caffeine_intake_mg_per_day`
- `mental_health_score` (target variable: 0-100 scale)

## 🛠️ Methodology

### **Data Engineering**
- Removal of irrelevant identifiers (`user_id`)
- Custom feature creation for behavioral insights

### **Feature Engineering** 
- `screen_per_hour_awake` - Screen intensity during waking hours
- `stress_to_sleep_ratio` - Stress relative to recovery time
- `digital_exhaustion` - Combined screen time × stress ÷ sleep  
- `wellbeing_score` - Mindfulness + activity - caffeine intake
- `caffeine_sleep_ratio` - Stimulant dependency patterns

### **Modeling Approach**
- **XGBoost Classifier** with 300 trees
- One-hot encoding for categorical variables  
- Normalization of numeric features
- **Binary Classification:** Mental health score < 50 = "Burnout Risk"

## 🚀 Model Performance

| Metric | Score |
|--------|-------|
| **Overall Accuracy** | 72%+ |
| **Precision** | High burnout detection |
| **Recall** | Minimal false negatives |
| **Model Type** | XGBoost Classification |

*Performance evaluated using confusion matrix and cross-validation*

## 🧩 Key Insights

✅ **Digital exhaustion** is the strongest predictor of burnout risk  
✅ **Sleep-to-stress ratio** significantly impacts mental wellness  
✅ **Screen time intensity** matters more than total hours  
✅ **Combined lifestyle factors** predict better than individual metrics  
✅ **Early warning signals** can be detected before clinical symptoms

## 💡 Real-World Applications

🏢 **Corporate Wellness**
- Employee burnout monitoring for remote teams
- Proactive mental health support programs

📱 **Digital Wellness Apps** 
- Personalized screen time recommendations
- Automated wellness check-ins and interventions

🧘 **Mental Health Services**
- Early warning system for therapists and coaches
- Data-driven treatment planning

🎯 **Personal Use**
- Self-monitoring digital habits
- Lifestyle optimization for better mental health

## 📈 Future Enhancements

- [ ] **Real-time monitoring** via wearable device integration
- [ ] **Interactive dashboard** for personal wellness tracking  
- [ ] **Mobile app** with push notifications for interventions
- [ ] **Multi-language support** for global deployment
- [ ] **Integration** with existing HR and wellness platforms

## 👤 Author

**Abhignav Valambatla**  
📍 Data Science & Machine Learning  
🔗 [LinkedIn](https://www.linkedin.com/in/abhigna-valambatla-0a216a149/) | [GitHub](https://github.com/abhignav1)



⚠️ **Important Notice:** This model is designed for research and early intervention purposes. It should complement, not replace, professional mental health assessment and care.
