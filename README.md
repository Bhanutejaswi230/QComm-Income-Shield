VIDEO LINK FOR STRATEGY EXPLAINING:
"https://drive.google.com/file/d/1-tAz_jmvLySNzxE6Wtv80SNQNDgujLKT/view?usp=drivesdk"
SprintShield AI: Parametric Income Protection for Q-Commerce
Project Status: Phase 1 - Foundation & Adversarial Defense (Guidewire DEVTrails 2026)
Mission: Protecting the livelihoods of India's Q-Commerce partners from external disruptions with AI-powered, fraud-resistant parametric insurance.
1. Project Overview & Requirement
SprintShield AI is an automated insurance platform built for platform-based delivery partners (Zepto, Blinkit, Swiggy Instamart). We solve the problem of Income Loss caused by uncontrollable factors like extreme weather, local curfews, or platform outages.
The Core Mandate:
Income Only: No coverage for health, life, or vehicle repairs.
Weekly Pricing: Micro-premiums aligned with the gig-worker payout cycle.
Parametric Payouts: Automatic claims triggered by real-world data, not manual filings.
2. Persona-Based Scenarios & Workflow
The Persona: "The Sprint Rider" (Ravi)
Profile: 24-year-old rider for Zepto in Mumbai.
Earnings: Relies on "Daily Milestone Incentives" (e.g., ₹300 bonus for 25 deliveries).
Scenario: A sudden heavy rainstorm (15mm/hr) floods the "Dark Store" radius. Ravi cannot ride for 3 hours. He loses his delivery fees and misses his daily bonus, suffering a 40% loss in daily wages.
The Application Workflow:
Onboarding: Ravi logs in; AI creates a Risk Profile based on his city and historical earnings.
Weekly Subscription: Ravi pays a small premium (₹49) for the upcoming week.
Live Monitoring: The system tracks weather and traffic APIs in Ravi's specific delivery zone.
Adversarial Validation: Before a payout, the system verifies Ravi's physical presence (see Section 3).
Instant Payout: Funds are credited to Ravi's digital wallet within minutes of the disruption being confirmed.
3. [CRITICAL] Adversarial Defense & Anti-Spoofing Strategy
To counter the "Market Crash" threat (coordinated GPS-spoofing syndicates), SprintShield AI has implemented an adversarial-grade verification layer:
A. Differentiation: Sensor Fusion vs. GPS Spoofing
Simple GPS is vulnerable to "Joystick" apps. Our AI differentiates bad actors using Sensor Fusion (Proof of Presence):
The Spoofer: GPS coordinates move, but the phone’s Accelerometer and Gyroscope show a perfectly static device.
The Genuine Worker: A rider on a bike shows constant micro-vibrations and tilt changes. Our AI flags any claim where GPS movement does not correlate with physical vibration data.
B. Anti-Syndicate Data Analysis
We detect coordinated fraud rings by analyzing:
Spatial-Temporal Clustering: If 500 claims originate from the exact same location/timestamp (a "Telegram-coordinated trigger"), the system auto-locks the liquidity pool.
Network Telemetry: We cross-verify GPS with Cell Tower IDs and Wi-Fi SSID clusters. While GPS can be faked, physical proximity to cellular hardware cannot.
Platform Sync: We use simulated API checks to see if the rider was "Active" and "Logged-in" on the Zepto/Blinkit partner app during the disruption.
C. UX Balance: The Trust-Score Engine
To avoid penalizing honest workers:
Dynamic Trust Score: Long-term honest riders get instant payouts.
Soft-Verification: New or flagged accounts aren't "Rejected"—they are asked for a "Proof-of-Life" (e.g., a 5-second video of the weather or a screenshot of their delivery app status) to unlock the claim.
4. Weekly Financial Model & Parametric Triggers
Weekly Pricing Structure
Average Weekly Premium: ₹49–₹75 (approx. 1% of weekly earnings).
Variable Pricing: AI adjusts the premium every Sunday night based on the upcoming week’s weather/social forecast (e.g., Monsoon weeks have higher premiums than summer weeks).
Payout: ₹250 (Minor disruption) to ₹600 (Major disruption).
Parametric Triggers (Indicative)
Weather: Precipitation > 12mm/hr or Temp > 46°C for 2+ hours.
Social: Localized road closures/protests identified via Google Maps velocity data (< 5km/hr).
Technical: Major platform server outages (3+ hours).
5. Platform Choice: Why Mobile?
Choice: Mobile Application (Flutter)
Hardware Access: Critical for reading Accelerometer/Gyroscope data to prevent GPS spoofing.
Hyper-Locality: Delivery partners are 100% mobile-reliant; a web platform would not allow for real-time background monitoring of disruptions while the rider is on the road.
6. AI/ML Integration Workflow
Dynamic Pricing (Regression): Predicts the probability of a payout based on historical disruption data per Pin Code.
Anomaly Detection (Isolation Forest): The core of our Fraud Detection—it identifies "outlier" behavior such as "Impossible Travel" (teleporting across the city) or coordinated syndicate claims.
Predictive Risk Profiling: Categorizes riders into "Safe," "Alert," or "Fraudulent" tiers based on historical interaction.
7. Tech Stack & Development Plan
Tech Stack
Frontend: Flutter (Mobile App).
Backend: Node.js with Express.
Database: Firebase (Real-time DB for instant payouts).
AI/ML: Python (FastAPI + Scikit-Learn).
APIs: OpenWeatherMap, Google Maps, and Simulated Platform APIs.
6-Week Development Roadmap
Week 1-2: Persona Research, UI/UX Prototypes, and API Foundation.
Week 3-4: Development of the Parametric Trigger Engine and Dynamic Pricing ML model.
Week 5: Implementation of the Adversarial Defense Layer (Sensor Fusion & Anti-Spoofing logic).
Week 6: Stress testing against "Market Crash" scenarios and Analytics Dashboard.
8. Extended Technical & Business Logic (Deep Dive)
A. The Actuarial Logic: Why ₹49/Week?
To ensure the liquidity pool doesn't drain, SprintShield AI uses a Risk-Pooled Pricing Model:
The Math: In a tier-1 city like Mumbai, historical data shows a 15% probability of a "Disruption Event" (heavy rain/protest) per week.
The Pool: If 10,000 riders subscribe at ₹49/week, the weekly pool is ₹4.9 Lakhs.
The Payout: If 1,500 riders (15%) are affected and paid ₹250 each, the total payout is ₹3.75 Lakhs.
Sustainability: This leaves a 23% margin for operational costs and "Market Crash" reserves, making the model financially viable for the insurer while staying affordable for the rider.
B. Deep Dive: Physics-Based Anti-Spoofing (Sensor Fusion)
GPS spoofing apps (like Fake GPS Go) override the LocationManager in Android, but they cannot simulate the Micro-Oscillations of a moving vehicle.
The Logic: SprintShield AI captures a 3-second "Health Heartbeat" of the phone’s Accelerometer during a payout trigger.
The Test: A genuine rider on a bike shows a specific frequency of vibration (engine idle or road friction). A spoofer’s phone is either perfectly still or shows artificial, repetitive motion patterns. Our Neural Network Classifier identifies these "Non-Human" movement signatures with 98% accuracy.
C. Handling Coordinated Syndicates (Spatial Clustering)
When the "Market Crash" occurs, fraud rings act in coordination (via Telegram/WhatsApp).
DBSCAN Clustering: Our AI uses the DBSCAN (Density-Based Spatial Clustering of Applications with Noise) algorithm.
The Detection: If the system sees 50+ claims appearing from a single high-density GPS cluster (e.g., a residential building) while the weather disruption is spread across a 5km radius, the AI identifies this as a "Syndicate Node" and triggers an immediate Manual Review or Video-Proof Request, protecting the liquidity pool from mass drainage.
D. The "Soft-Verification" UX Design
We believe in "Innocent Until Flagged."
Green Tier: High-tenure riders with consistent delivery history get Instant Payouts.
Yellow Tier (Flagged): If Sensor Fusion data is "Inconclusive" (e.g., the phone was in a backpack), the rider gets a notification: "Presence Unverified. Please upload a 5-second video of your surroundings to unlock your payout."
Red Tier (Fraud): Confirmed spoofing leads to a 2-week "Cooling-off Period" where the rider cannot subscribe, preserving the ecosystem's integrity.
