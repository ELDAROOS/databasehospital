CREATE TABLE IF NOT EXISTS patients
(
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    address VARCHAR(100),
    phone VARCHAR,
    gender CHAR(1)
);

CREATE TABLE IF NOT EXISTS doctors
(
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialization VARCHAR(50),
    contact_info VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS doctorspecialties
(
    specialty_id SERIAL PRIMARY KEY,
    specialty_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS allergies
(
    allergy_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    allergen_name VARCHAR(50),
    description TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE IF NOT EXISTS appointments
(
    appointment_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    doctor_id INTEGER,
    appointment_datetime TIMESTAMP,
    diagnosis VARCHAR(100),
    prescriptions TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE IF NOT EXISTS electronicmedicalrecord
(
    emr_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    record_creation_date TIMESTAMP,
    text_description TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE IF NOT EXISTS insurance
(
    insurance_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    insurance_company_name VARCHAR(50),
    policy_number VARCHAR(20),
    expiration_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE IF NOT EXISTS medicalhistory
(
    record_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    record_date DATE,
    symptom_description TEXT,
    test_results TEXT,
    doctor_notes TEXT,
    doctor_id INTEGER,
    diagnosis VARCHAR,
    treatment VARCHAR,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE IF NOT EXISTS medicaltests
(
    test_id SERIAL PRIMARY KEY,
    test_name VARCHAR(50),
    test_date DATE,
    results TEXT,
    medical_history_id INTEGER,
    patient_id INTEGER,
    result VARCHAR,
    unit VARCHAR(50),
    reference_range VARCHAR,
    doctor_id INTEGER,
    lab_name VARCHAR,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (medical_history_id) REFERENCES medicalhistory(record_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE IF NOT EXISTS medications
(
    medication_id SERIAL PRIMARY KEY,
    medication_name VARCHAR(50),
    description TEXT,
    manufacturer VARCHAR(50),
    dosage VARCHAR(20),
    dosage_form VARCHAR,
    route_of_administration VARCHAR
);

CREATE TABLE IF NOT EXISTS prescriptions
(
    prescription_id SERIAL PRIMARY KEY,
    doctor_id INTEGER,
    patient_id INTEGER,
    medication_id INTEGER,
    dosage VARCHAR(20),
    instructions TEXT,
    prescription_date DATE,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (medication_id) REFERENCES medications(medication_id)
);

CREATE TABLE IF NOT EXISTS surgeries
(
    surgery_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    surgery_date DATE,
    surgery_name VARCHAR(100),
    surgeon VARCHAR(100),
    description TEXT,
    medical_history_id INTEGER,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (medical_history_id) REFERENCES medicalhistory(record_id)
);

CREATE TABLE IF NOT EXISTS vaccinations
(
    vaccination_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    vaccine_name VARCHAR,
    vaccination_date DATE,
    dosage VARCHAR,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE IF NOT EXISTS visits
(
    visit_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    visit_date DATE,
    visit_description TEXT,
    results TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);

CREATE TABLE IF NOT EXISTS vitalsigns
(
    vital_sign_id SERIAL PRIMARY KEY,
    patient_id INTEGER,
    measurement_datetime TIMESTAMP,
    temperature NUMERIC(5, 2),
    blood_pressure VARCHAR(20),
    pulse INTEGER,
    weight NUMERIC(5, 2),
    height NUMERIC(5, 2),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);
INSERT INTO patients (first_name, last_name, date_of_birth, address, phone, gender) VALUES
('John', 'Doe', '1990-05-15', '123 Main St, City', '123-456-7890', 'M'),
('Jane', 'Smith', '1985-08-22', '456 Elm St, Town', '987-654-3210', 'F'),
('Mike', 'Johnson', '1978-12-10', '789 Oak St, Village', '555-555-5555', 'M'),
('Emily', 'Davis', '1995-03-28', '101 Pine St, Hamlet', '111-222-3333', 'F'),
('Chris', 'Wilson', '1980-09-17', '246 Cedar St, County', '999-888-7777', 'M'),
('Sara', 'Brown', '1992-11-03', '369 Maple St, District', '444-333-2222', 'F'),
('David', 'Miller', '1976-07-09', '852 Birch St, Town', '777-666-5555', 'M'),
('Olivia', 'Garcia', '1987-04-12', '753 Oak St, City', '222-333-4444', 'F'),
('Michael', 'Martinez', '1999-01-25', '963 Elm St, Village', '888-999-1111', 'M'),
('Sophia', 'Clark', '1983-06-30', '147 Pine St, Hamlet', '333-222-1111', 'F'),
('Daniel', 'Lee', '1973-02-18', '369 Cedar St, County', '555-666-7777', 'M'),
('Ava', 'Lopez', '1998-10-05', '753 Maple St, District', '999-888-7777', 'F'),
('James', 'Hill', '1991-08-08', '159 Birch St, Town', '777-666-5555', 'M'),
('Mia', 'Scott', '1989-12-01', '357 Oak St, City', '111-222-3333', 'F'),
('Ethan', 'Young', '1975-05-20', '951 Elm St, Village', '444-555-6666', 'M');

select * from  patients

INSERT INTO doctors (first_name, last_name, specialization, contact_info) VALUES
('Alice', 'Johnson', 'Cardiology', 'alice@example.com'),
('Bob', 'Smith', 'Pediatrics', 'bob@example.com'),
('Catherine', 'Davis', 'Orthopedics', 'catherine@example.com'),
('David', 'Garcia', 'Neurology', 'david@example.com'),
('Emma', 'Martinez', 'Dermatology', 'emma@example.com'),
('Frank', 'Lee', 'Oncology', 'frank@example.com'),
('Grace', 'Clark', 'Gynecology', 'grace@example.com'),
('Henry', 'Lopez', 'Psychiatry', 'henry@example.com'),
('Isabella', 'Hill', 'Endocrinology', 'isabella@example.com'),
('Jack', 'Gonzalez', 'Urology', 'jack@example.com'),
('Karen', 'Adams', 'Rheumatology', 'karen@example.com'),
('Leo', 'Taylor', 'Hematology', 'leo@example.com'),
('Mia', 'Brown', 'Pulmonology', 'mia@example.com'),
('Nathan', 'Wright', 'Gastroenterology', 'nathan@example.com'),
('Olivia', 'Perez', 'Ophthalmology', 'olivia@example.com');

select * from doctors

INSERT INTO doctorspecialties (specialty_name) VALUES
('Cardiology'),
('Pediatrics'),
('Orthopedics'),
('Neurology'),
('Dermatology'),
('Oncology'),
('Gynecology'),
('Psychiatry'),
('Endocrinology'),
('Urology'),
('Rheumatology'),
('Hematology'),
('Pulmonology'),
('Gastroenterology'),
('Ophthalmology');

select * from doctorspecialties

INSERT INTO allergies (patient_id, allergen_name, description) VALUES
(1, 'Peanuts', 'Allergic reaction causes swelling and difficulty breathing.'),
(2, 'Pollen', 'Causes sneezing and itchy eyes.'),
(3, 'Penicillin', 'Causes rash and itching.'),
(4, 'Dust Mites', 'Leads to respiratory issues.'),
(5, 'Seafood', 'Results in nausea and hives.'),
(6, 'Latex', 'Causes skin irritation and itching.'),
(7, 'Mold', 'Leads to coughing and wheezing.'),
(8, 'Eggs', 'Causes digestive discomfort.'),
(9, 'Grass', 'Results in sneezing and congestion.'),
(10, 'Cat Hair', 'Causes allergic reactions like sneezing and itching.'),
(11, 'Milk', 'Leads to digestive issues.'),
(12, 'Shellfish', 'Results in skin rash and swelling.'),
(13, 'Insect Stings', 'Causes severe allergic reactions like anaphylaxis.'),
(14, 'Tree Nuts', 'Results in hives and swelling.'),
(15, 'Soy', 'Leads to digestive discomfort and hives.');

select * from allergies

INSERT INTO appointments (patient_id, doctor_id, appointment_datetime, diagnosis, prescriptions) VALUES
(1, 2, '2023-01-10 09:00:00', 'Common cold', 'Rest and fluids.'),
(2, 3, '2023-01-15 10:30:00', 'Seasonal allergies', 'Antihistamines prescribed.'),
(3, 4, '2023-01-20 11:15:00', 'Suspected flu', 'Prescription for antiviral medication.'),
(4, 5, '2023-01-25 14:00:00', 'Minor injury', 'Bandaging and pain relief suggested.'),
(5, 6, '2023-02-05 09:30:00', 'Skin rash', 'Topical cream prescribed.'),
(6, 7, '2023-02-10 13:45:00', 'Digestive discomfort', 'Dietary recommendations provided.'),
(7, 8, '2023-02-15 11:00:00', 'Anxiety', 'Therapy sessions scheduled.'),
(8, 9, '2023-02-20 10:00:00', 'Thyroid disorder', 'Medication prescribed.'),
(9, 10, '2023-03-05 12:30:00', 'Urinary tract infection', 'Prescription for antibiotics.'),
(10, 11, '2023-03-10 14:15:00', 'Arthritis pain', 'Pain relief medication prescribed.'),
(11, 12, '2023-03-15 15:00:00', 'Asthma check-up', 'Adjustment in inhaler dosage.'),
(12, 13, '2023-04-05 09:45:00', 'Allergic reaction', 'Epinephrine injection prescribed.'),
(13, 14, '2023-04-10 08:30:00', 'Nutritional advice', 'Diet plan recommended.'),
(14, 15, '2023-04-15 10:45:00', 'High blood pressure', 'Prescription for hypertension.'),
(15, 1, '2023-05-05 11:30:00', 'Diabetes check-up', 'Insulin dosage adjustment.');

select * from appointments

INSERT INTO electronicmedicalrecord (patient_id, record_creation_date, text_description) VALUES
(1, '2023-01-05 08:00:00', 'Patient complained of sore throat and cough.'),
(2, '2023-01-10 09:30:00', 'Visited for seasonal allergy symptoms.'),
(3, '2023-01-15 10:45:00', 'Suspected flu symptoms reported.'),
(4, '2023-01-20 11:30:00', 'Patient presented with minor injury on the arm.'),
(5, '2023-02-05 12:00:00', 'Skin rash observed on patient.'),
(6, '2023-02-10 13:00:00', 'Digestive discomfort reported by the patient.'),
(7, '2023-02-15 14:15:00', 'Visited for anxiety-related concerns.'),
(8, '2023-02-20 15:30:00', 'Thyroid disorder symptoms documented.'),
(9, '2023-03-05 08:45:00', 'Urinary tract infection symptoms noted.'),
(10, '2023-03-10 09:00:00', 'Arthritis pain reported by the patient.'),
(11, '2023-03-15 10:15:00', 'Asthma symptoms observed during check-up.'),
(12, '2023-04-05 11:30:00', 'Patient presented with allergic reaction.'),
(13, '2023-04-10 12:45:00', 'Nutritional advice requested by the patient.'),
(14, '2023-04-15 13:00:00', 'High blood pressure symptoms documented.'),
(15, '2023-05-05 14:15:00', 'Diabetes check-up and insulin dosage review.');

select * from electronicmedicalrecord

INSERT INTO insurance (patient_id, insurance_company_name, policy_number, expiration_date) VALUES
(1, 'HealthInsure', 'HI123456', '2023-12-31'),
(2, 'MediCare', 'MC789012', '2023-11-30'),
(3, 'WellGuard', 'WG345678', '2023-10-31'),
(4, 'SecureHealth', 'SH567890', '2023-09-30'),
(5, 'GuardianCare', 'GC234567', '2023-08-31'),
(6, 'HealthSafe', 'HS456789', '2023-07-31'),
(7, 'MediCover', 'MC123456', '2023-06-30'),
(8, 'LifeCare', 'LC890123', '2023-05-31'),
(9, 'TrustShield', 'TS678901', '2023-04-30'),
(10, 'WellBeing', 'WB789012', '2023-03-31'),
(11, 'SafeGuard', 'SG234567', '2023-02-28'),
(12, 'HealthNet', 'HN456789', '2023-01-31'),
(13, 'CoverAll', 'CA567890', '2022-12-31'),
(14, 'SureHealth', 'SH123456', '2022-11-30'),
(15, 'GuardianPlus', 'GP789012', '2022-10-31');

select * from insurance

INSERT INTO medicalhistory (patient_id, record_date, symptom_description, test_results, doctor_notes, doctor_id, diagnosis, treatment) VALUES
(1, '2022-01-01', 'Fever and sore throat', 'Negative for strep throat', 'Prescribed rest and fluids', 2, 'Viral infection', 'Rest and fluids'),
(2, '2022-01-05', 'Runny nose and sneezing', 'Allergy test results pending', 'Advised to stay indoors', 3, 'Seasonal allergies', 'Antihistamines'),
(3, '2022-01-10', 'Fever and body aches', 'Positive for influenza', 'Prescribed antiviral medication', 4, 'Influenza', 'Antiviral medication'),
(4, '2022-01-15', 'Minor cut on the arm', 'Sutured wound, no infection', 'Scheduled follow-up in a week', 5, 'Minor injury', 'Wound care'),
(5, '2022-01-20', 'Itchy skin rash', 'Allergy test results pending', 'Prescribed topical cream', 6, 'Skin allergy', 'Topical cream'),
(6, '2022-02-01', 'Stomach ache and bloating', 'Negative for food allergies', 'Suggested dietary changes', 7, 'Digestive discomfort', 'Diet modification'),
(7, '2022-02-05', 'Anxiety and panic attacks', 'No significant test results', 'Scheduled regular therapy sessions', 8, 'Anxiety disorder', 'Therapy sessions'),
(8, '2022-02-10', 'Fatigue and weight gain', 'Abnormal thyroid hormone levels', 'Prescribed thyroid medication', 9, 'Hypothyroidism', 'Thyroid medication'),
(9, '2022-02-15', 'Burning sensation while urinating', 'Positive for urinary tract infection', 'Prescribed antibiotics', 10, 'Urinary tract infection', 'Antibiotics'),
(10, '2022-03-01', 'Joint pain and stiffness', 'Positive for arthritis markers', 'Recommended pain management', 11, 'Arthritis', 'Pain relief medication'),
(11, '2022-03-05', 'Shortness of breath and wheezing', 'Abnormal lung function tests', 'Prescribed inhaler adjustment', 12, 'Asthma exacerbation', 'Inhaler adjustment'),
(12, '2022-04-01', 'Swelling and redness due to allergy', 'Treated allergic reaction', 'Prescribed epinephrine auto-injector', 13, 'Allergic reaction', 'Epinephrine auto-injector'),
(13, '2022-04-05', 'Dietary counseling request', 'Nutritional analysis pending', 'Scheduled nutrition consultation', 14, 'Nutritional advice', 'Diet consultation'),
(14, '2022-04-10', 'Elevated blood pressure readings', 'Hypertension diagnosis confirmed', 'Prescribed antihypertensive medication', 15, 'Hypertension', 'Antihypertensive medication'),
(15, '2022-05-01', 'Diabetes management review', 'Stable blood sugar levels', 'Adjusted insulin dosage', 1, 'Diabetes mellitus', 'Insulin dosage adjustment');

select * from medicalhistory

INSERT INTO medicaltests (test_name, test_date, results, medical_history_id, patient_id, result, unit, reference_range, doctor_id, lab_name) VALUES
('Blood Count', '2022-01-05', 'Within normal limits', 1, 1, 'Normal', 'cells/mcL', '4.5 - 11.0', 2, 'MedLab'),
('Allergy Panel', '2022-01-08', 'Positive for pollen and dust', 2, 2, 'Positive', 'IU/mL', '0.0 - 100.0', 3, 'HealthLab'),
('Flu Test', '2022-01-12', 'Positive for influenza virus', 3, 3, 'Positive', 'N/A', 'N/A', 4, 'MediTest'),
('Wound Culture', '2022-01-18', 'No bacterial growth', 4, 4, 'Normal', 'CFU/mL', '0 - 10', 5, 'MediLab'),
('Skin Allergy Test', '2022-01-25', 'Positive for latex allergy', 5, 5, 'Positive', 'mm', '0.0 - 5.0', 6, 'HealthLab'),
('Stool Culture', '2022-02-05', 'Negative for pathogens', 6, 6, 'Normal', 'CFU/g', '0 - 5', 7, 'MediTest'),
('EKG', '2022-02-12', 'Normal sinus rhythm', 7, 7, 'Normal', 'ms', 'N/A', 8, 'CardioLab'),
('Thyroid Function Test', '2022-02-18', 'Abnormal TSH levels', 8, 8, 'Abnormal', 'mIU/L', '0.4 - 4.0', 9, 'HealthLab'),
('Urinalysis', '2022-03-05', 'Positive for leukocytes', 9, 9, 'Abnormal', 'cells/uL', '0 - 5', 10, 'MediTest'),
('Arthritis Panel', '2022-03-10', 'Elevated inflammatory markers', 10, 10, 'Abnormal', 'mg/L', '0 - 5', 11, 'HealthLab'),
('Pulmonary Function Test', '2022-03-18', 'Reduced lung capacity', 11, 11, 'Abnormal', 'L', '2.0 - 5.0', 12, 'PulmoLab'),
('Allergy Scratch Test', '2022-04-02', 'Positive for insect stings', 12, 12, 'Positive', 'mm', '0.0 - 5.0', 13, 'HealthLab'),
('Nutritional Analysis', '2022-04-10', 'Low vitamin D levels', 13, 13, 'Low', 'ng/mL', '30 - 100', 14, 'NutriLab'),
('Blood Pressure Test', '2022-04-18', 'Elevated blood pressure', 14, 14, 'High', 'mmHg', '120/80', 15, 'MediTest'),
('Glucose Tolerance Test', '2022-05-02', 'Abnormal glucose levels', 15, 15, 'Abnormal', 'mg/dL', '70 - 140', 1, 'HealthLab');

select * from medicaltests

INSERT INTO medications (medication_name, description, manufacturer, dosage, dosage_form, route_of_administration) VALUES
('Ibuprofen', 'Pain reliever and fever reducer', 'PharmaCorp', '200mg', 'Tablet', 'Oral'),
('Amoxicillin', 'Antibiotic for bacterial infections', 'MediPharm', '500mg', 'Capsule', 'Oral'),
('Loratadine', 'Antihistamine for allergies', 'HealthCo', '10mg', 'Tablet', 'Oral'),
('Omeprazole', 'Proton pump inhibitor for heartburn', 'PharmaCare', '20mg', 'Capsule', 'Oral'),
('Prednisone', 'Anti-inflammatory steroid', 'MediPharm', '5mg', 'Tablet', 'Oral'),
('Diphenhydramine', 'Antihistamine for allergies and sleep aid', 'HealthCo', '25mg', 'Capsule', 'Oral'),
('Atorvastatin', 'Cholesterol-lowering medication', 'PharmaCorp', '40mg', 'Tablet', 'Oral'),
('Metformin', 'Diabetes medication', 'MediPharm', '1000mg', 'Tablet', 'Oral'),
('Losartan', 'Blood pressure medication', 'HealthCo', '50mg', 'Tablet', 'Oral'),
('Sertraline', 'Antidepressant', 'PharmaCare', '50mg', 'Tablet', 'Oral'),
('Albuterol', 'Bronchodilator for asthma', 'MediPharm', '2mg', 'Inhaler', 'Inhalation'),
('Levothyroxine', 'Thyroid hormone replacement', 'HealthCo', '50mcg', 'Tablet', 'Oral'),
('Warfarin', 'Blood thinner', 'PharmaCorp', '5mg', 'Tablet', 'Oral'),
('Insulin', 'Diabetes medication', 'MediPharm', '10 units', 'Injection', 'Subcutaneous'),
('Morphine', 'Pain reliever', 'HealthCo', '10mg', 'Tablet', 'Oral');

select * from medications

INSERT INTO prescriptions (doctor_id, patient_id, medication_id, dosage, instructions, prescription_date) VALUES
(1, 1, 1, '200mg', 'Take with food, every 4-6 hours as needed for pain', '2022-01-05'),
(2, 2, 2, '500mg', 'Take two capsules daily for 7 days', '2022-01-10'),
(3, 3, 3, '10mg', 'Take one tablet daily in the evening', '2022-01-15'),
(4, 4, 4, '20mg', 'Take one capsule before breakfast', '2022-01-20'),
(5, 5, 5, '5mg', 'Take one tablet daily for 5 days, then taper off', '2022-02-05'),
(6, 6, 6, '25mg', 'Take one capsule at bedtime as needed for allergies or sleep', '2022-02-10'),
(7, 7, 7, '40mg', 'Take one tablet daily in the evening', '2022-02-15'),
(8, 8, 8, '1000mg', 'Take one tablet twice daily with meals', '2022-03-05'),
(9, 9, 9, '50mg', 'Take one tablet daily in the morning', '2022-03-10'),
(10, 10, 10, '50mg', 'Take one tablet daily in the morning', '2022-03-15'),
(11, 11, 11, '2mg', 'Use inhaler as needed for asthma symptoms', '2022-04-01'),
(12, 12, 12, '50mcg', 'Take one tablet daily in the morning', '2022-04-10'),
(13, 13, 13, '5mg', 'Take one tablet daily in the evening', '2022-04-15'),
(14, 14, 14, '10 units', 'Inject 10 units subcutaneously twice daily', '2022-05-05'),
(15, 15, 15, '10mg', 'Take one tablet as needed for severe pain', '2022-05-15');

select * from prescriptions 

INSERT INTO surgeries (patient_id, surgery_date, surgery_name, surgeon, description, medical_history_id) VALUES
(1, '2022-01-10', 'Appendectomy', 'Dr. Smith', 'Appendix removal due to acute appendicitis', 1),
(2, '2022-02-05', 'Knee arthroscopy', 'Dr. Johnson', 'Arthroscopic surgery to repair torn meniscus', 2),
(3, '2022-03-15', 'Gallbladder removal', 'Dr. Williams', 'Laparoscopic cholecystectomy for gallstones', 3),
(4, '2022-04-20', 'Hernia repair', 'Dr. Brown', 'Surgical repair of inguinal hernia', 4),
(5, '2022-05-25', 'Cataract surgery', 'Dr. Davis', 'Surgical removal of cataract and lens replacement', 5),
(6, '2022-06-30', 'ACL reconstruction', 'Dr. Wilson', 'Surgical repair of torn anterior cruciate ligament', 6),
(7, '2022-07-10', 'Gastric bypass surgery', 'Dr. Martinez', 'Bariatric surgery for weight loss', 7),
(8, '2022-08-15', 'Spinal fusion', 'Dr. Garcia', 'Surgical fusion of vertebrae for spinal stability', 8),
(9, '2022-09-20', 'Heart bypass surgery', 'Dr. Rodriguez', 'Coronary artery bypass grafting for heart disease', 9),
(10, '2022-10-25', 'Hip replacement', 'Dr. Hernandez', 'Surgical replacement of hip joint', 10),
(11, '2022-11-30', 'Lumpectomy', 'Dr. Lopez', 'Surgical removal of breast tumor', 11),
(12, '2023-01-05', 'Prostatectomy', 'Dr. Torres', 'Surgical removal of prostate gland', 12),
(13, '2023-02-10', 'Tonsillectomy', 'Dr. Gomez', 'Surgical removal of tonsils', 13),
(14, '2023-03-15', 'Rhinoplasty', 'Dr. Ramirez', 'Surgical reshaping of the nose', 14),
(15, '2023-04-20', 'Laminectomy', 'Dr. Flores', 'Surgical removal of part of the vertebral bone', 15);

select * from surgeries

INSERT INTO vaccinations (patient_id, vaccine_name, vaccination_date, dosage) VALUES
(1, 'COVID-19 Vaccine', '2021-12-15', '2 doses, 30µg each'),
(2, 'Influenza Vaccine', '2021-11-20', '1 dose, 15µg'),
(3, 'Hepatitis B Vaccine', '2021-10-25', '3 doses, 20µg each'),
(4, 'MMR Vaccine', '2021-09-30', '2 doses, varied dosage'),
(5, 'Tetanus Vaccine', '2021-08-15', '1 dose, 10µg'),
(6, 'Pneumococcal Vaccine', '2021-07-10', '2 doses, 25µg each'),
(7, 'HPV Vaccine', '2021-06-05', '2 doses, varied dosage'),
(8, 'Varicella Vaccine', '2021-05-01', '2 doses, varied dosage'),
(9, 'Diphtheria Vaccine', '2021-04-02', '1 dose, 5µg'),
(10, 'Hib Vaccine', '2021-03-20', '3 doses, varied dosage'),
(11, 'Rotavirus Vaccine', '2021-02-15', '2 doses, varied dosage'),
(12, 'Meningococcal Vaccine', '2021-01-10', '2 doses, varied dosage'),
(13, 'Polio Vaccine', '2020-12-05', '4 doses, varied dosage'),
(14, 'Yellow Fever Vaccine', '2020-11-01', '1 dose, varied dosage'),
(15, 'Rabies Vaccine', '2020-10-10', '4 doses, varied dosage');

select * from vaccinations

INSERT INTO visits (patient_id, visit_date, visit_description, results) VALUES
(1, '2022-01-05', 'Follow-up after surgery', 'Recovery progressing well'),
(2, '2022-01-10', 'Routine checkup', 'No issues reported'),
(3, '2022-01-15', 'Complaints of abdominal pain', 'Prescribed medication for gastritis'),
(4, '2022-01-20', 'Blood pressure check', 'Slightly elevated BP, advised lifestyle changes'),
(5, '2022-01-25', 'Annual physical examination', 'All vitals within normal ranges'),
(6, '2022-02-05', 'Follow-up on allergy treatment', 'Reduced allergic symptoms observed'),
(7, '2022-02-10', 'Post-operation review', 'Incision healing properly'),
(8, '2022-02-15', 'Discussion on diabetes management', 'Advised dietary modifications'),
(9, '2022-03-05', 'Consultation for joint pain', 'Recommended physiotherapy exercises'),
(10, '2022-03-10', 'Review of vaccination schedule', 'Administered missed vaccines'),
(11, '2022-03-15', 'Monitoring for respiratory infection', 'Prescribed antibiotics for bronchitis'),
(12, '2022-04-01', 'Discussion about depression symptoms', 'Referred to counseling services'),
(13, '2022-04-10', 'Follow-up on heart condition', 'EKG results stable, advised regular checkups'),
(14, '2022-04-15', 'Post-vaccination observation', 'No adverse reactions reported'),
(15, '2022-05-05', 'Evaluation of medication side effects', 'Adjusted dosage for better tolerance');

select * from visits

INSERT INTO vitalsigns (patient_id, measurement_datetime, temperature, blood_pressure, pulse, weight, height) VALUES
(1, '2022-01-05 08:00:00', 98.6, '120/80', 70, 68.5, 170),
(2, '2022-01-10 09:30:00', 99.1, '118/76', 72, 75.2, 165),
(3, '2022-01-15 10:15:00', 97.9, '122/78', 68, 61.8, 155),
(4, '2022-01-20 11:00:00', 98.2, '130/85', 75, 80.1, 175),
(5, '2022-01-25 08:45:00', 98.5, '125/82', 71, 70.3, 180),
(6, '2022-02-05 07:30:00', 99.0, '118/75', 73, 73.6, 168),
(7, '2022-02-10 09:00:00', 98.7, '120/80', 70, 67.2, 162),
(8, '2022-02-15 10:45:00', 98.4, '128/83', 76, 79.0, 170),
(9, '2022-03-05 12:30:00', 99.2, '122/78', 68, 64.5, 158),
(10, '2022-03-10 14:15:00', 98.9, '130/85', 75, 82.3, 176),
(11, '2022-03-15 08:00:00', 98.3, '125/80', 72, 69.8, 182),
(12, '2022-04-01 09:45:00', 98.6, '118/76', 74, 72.1, 165),
(13, '2022-04-10 11:30:00', 98.1, '120/80', 71, 77.5, 172),
(14, '2022-04-15 13:00:00', 98.4, '128/83', 77, 81.2, 178),
(15, '2022-05-05 14:45:00', 98.0, '122/78', 69, 68.7, 166);

select * from vitalsigns
