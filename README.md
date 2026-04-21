# VidyaRaksha — AI-Powered Rural Student Dropout Early Warning System

An ML-powered system that predicts student dropout risk in rural Indian schools, provides explainable AI insights via SHAP, offers professional Excel/CSV reports, and recommends government welfare schemes.

## 🏗 Architecture

```
┌─────────────┐     ┌──────────────┐     ┌──────────────┐
│   Frontend   │────▶│  Flask API   │────▶│  SQLite/     │
│  HTML/CSS/JS │◀────│  (Backend)   │◀────│  PostgreSQL  │
│  + Chart.js  │     │  + JWT Auth  │     │              │
└─────────────┘     └──────┬───────┘     └──────────────┘
                           │
               ┌────────────┼────────────┐
               ▼            ▼            ▼
         ┌──────────┐ ┌──────────┐ ┌──────────────┐
         │ ML Model │ │  SHAP    │ │ Excel / CSV  │
         │ (RF/XGB) │ │ Explain  │ │ Export       │
         └──────────┘ └──────────┘ └──────────────┘
```

## 🚀 Quick Start (Local Development)

### Prerequisites
- Python 3.9+
- pip

### 1. Install Dependencies
```bash
cd backend
pip install -r requirements.txt
```

### 2. Train the ML Model
```bash
cd backend
python -m ml.train_model
```

### 3. Run the Server
```bash
cd backend
python app.py
```

### 4. Open the App
Navigate to **http://localhost:5000** in your browser.

### Default Login Credentials
| Role | Username | Password |
|------|----------|----------|
| Admin | admin | admin123 |
| Teacher | teacher | teacher123 |
| Gov Officer | officer | officer123 |
| Parent | parent | parent123 |

## 📁 Project Structure

```
IDT/
├── backend/
│   ├── app.py                    # Flask application entry point
│   ├── config.py                 # Configuration management
│   ├── requirements.txt          # Python dependencies
│   ├── models/
│   │   └── database.py           # SQLAlchemy ORM models
│   ├── routes/
│   │   ├── auth.py               # JWT authentication
│   │   ├── students.py           # Student CRUD + statistics
│   │   ├── predictions.py        # ML prediction + SHAP
│   │   └── schemes.py            # Government scheme endpoints
│   ├── ml/
│   │   ├── train_model.py        # Training pipeline (RF, XGBoost, LR)
│   │   ├── predict.py            # Inference engine
│   │   └── explainer.py          # SHAP explainability
│   ├── services/
│   │   └── scheme_matcher.py     # Rule-based scheme matching
│   ├── data/
│   │   ├── seed_data.py          # Database seeder
│   │   └── sample_students.csv   # Sample dataset
│   └── tests/
│       └── test_api.py           # Comprehensive API tests
├── frontend/
│   ├── index.html                # Dashboard UI
│   ├── styles.css                # Design system
│   └── app.js                    # Application logic + API
├── docker-compose.yml            # Multi-container deployment
├── Dockerfile.backend            # Backend container
├── Dockerfile.frontend           # Nginx container
├── nginx.conf                    # Reverse proxy config
├── .env.example                  # Environment template
└── README.md                     # This file
```

## 🧠 ML Pipeline

### Models Trained
1. **Logistic Regression** — Baseline
2. **Random Forest** — Best performer (selected)
3. **Gradient Boosting** — Alternative

### Features Used
| Feature | Weight | Description |
|---------|--------|-------------|
| Attendance (%) | 30% | School attendance rate |
| Exam Score | 25% | Average exam performance |
| Family Income | 15% | Monthly household income |
| Distance to School | 10% | Commute distance in km |
| Parent Education | 8% | Parent educational level |
| Health Issues | 5% | Chronic health problems |
| Internet Access | 4% | Digital connectivity |
| Previous Failures | 3% | Academic failure count |

### Risk Categories
- **Low (0–34%)** — Student is safe
- **Medium (35–64%)** — Intervention recommended
- **High (65–100%)** — Immediate action required

## 📊 Data Export System

VidyaRaksha supports high-performance data export for school administrators and government officials:
- **Excel (.xls)** — Formatted for advanced data analysis and reporting.
- **CSV (.csv)** — Lightweight, standard format for interoperability with other systems.

## 🏛 Government Schemes

Auto-matched schemes include:
- Pre-Matric Scholarship (low income)
- Beti Bachao Beti Padhao (girl students)
- Free Bicycle Scheme (long distance)
- Rashtriya Bal Swasthya (health issues)
- PM eVidya (no internet access)
- Samagra Shiksha Abhiyan (remote areas)

## 🐳 Docker Deployment

```bash
# Build and run all containers
docker-compose up --build -d

# View logs
docker-compose logs -f

# Stop
docker-compose down
```

Services: PostgreSQL (port 5432), Flask API (port 5000), Nginx (port 80).

## 🧪 Testing

```bash
cd backend
python -m pytest tests/ -v
```

## 🔐 Security

- JWT-based authentication with 24h token expiry
- Role-based access control (Admin, Teacher, Gov Officer)
- Password hashing with Werkzeug
- CORS protection
- Input validation on all endpoints

## 📊 API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | /api/auth/login | User login |
| POST | /api/auth/register | Register user |
| GET | /api/students/ | List students |
| POST | /api/students/ | Create student |
| POST | /api/students/upload-csv | Import CSV |
| GET | /api/students/statistics | Dashboard stats |
| POST | /api/predictions/predict | Predict risk |
| POST | /api/predictions/predict-batch | Batch predict |
| POST | /api/predictions/predict-batch | Batch predict |
| GET | /api/schemes/ | List schemes |
| GET | /api/schemes/match/:id | Match for student |
| GET | /api/health | System health |

## 👥 Team

**Sahyadri College of Engineering — IDEATERS**

---
*Built with ❤️ for rural education in India*

