
-- Step 1: Create Tables

CREATE TABLE companies (
  id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  industry VARCHAR(100),
  location VARCHAR(100),
  website VARCHAR(200),
  founded_year INTEGER
);

CREATE TABLE jobs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  description TEXT,
  location VARCHAR(100),
  job_type VARCHAR(50) CHECK (job_type IN ('full-time','part-time','remote','internship')),
  salary_min INTEGER,
  salary_max INTEGER,
  experience_years INTEGER DEFAULT 0,
  company_id INTEGER REFERENCES companies(id) ON DELETE CASCADE,
  posted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  is_active BOOLEAN DEFAULT true
);

-- =============================================
-- Step 2: Insert Companies (20 companies)
-- =============================================

INSERT INTO companies (name, industry, location, website, founded_year) VALUES
('Tata Consultancy Services', 'IT Services',         'Mumbai',    'https://www.tcs.com',        1968),
('Infosys',                   'IT Services',         'Bangalore', 'https://www.infosys.com',    1981),
('Wipro Technologies',        'IT Services',         'Bangalore', 'https://www.wipro.com',      1945),
('HCL Technologies',          'IT Services',         'Noida',     'https://www.hcltech.com',    1976),
('Tech Mahindra',             'IT Services',         'Pune',      'https://www.techmahindra.com',1986),
('Razorpay',                  'Fintech',             'Bangalore', 'https://razorpay.com',       2014),
('Zepto',                     'Quick Commerce',      'Mumbai',    'https://www.zeptonow.com',   2021),
('Swiggy',                    'Food Delivery',       'Bangalore', 'https://www.swiggy.com',     2014),
('Zomato',                    'Food Delivery',       'Gurugram',  'https://www.zomato.com',     2008),
('Meesho',                    'E-Commerce',          'Bangalore', 'https://meesho.com',         2015),
('PhonePe',                   'Fintech',             'Bangalore', 'https://www.phonepe.com',    2015),
('CRED',                      'Fintech',             'Bangalore', 'https://www.cred.club',      2018),
('Ola Electric',              'EV & Mobility',       'Bangalore', 'https://olaelectric.com',    2017),
('Dream11',                   'Gaming & Sports',     'Mumbai',    'https://www.dream11.com',    2008),
('Byju\'s',                   'EdTech',              'Bangalore', 'https://byjus.com',          2011),
('Unacademy',                 'EdTech',              'Bangalore', 'https://unacademy.com',      2015),
('Nykaa',                     'Beauty & E-Commerce', 'Mumbai',    'https://www.nykaa.com',      2012),
('Lenskart',                  'Retail & Optical',    'New Delhi', 'https://www.lenskart.com',   2010),
('Urban Company',             'Home Services',       'Gurugram',  'https://www.urbancompany.com',2014),
('MakeMyTrip',                'Travel & Tourism',    'Gurugram',  'https://www.makemytrip.com', 2000);

-- =============================================
-- Step 3: Insert Jobs (80 jobs)
-- =============================================

-- TCS (company_id = 1)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Java Backend Developer',     'Develop and maintain Java-based enterprise applications using Spring Boot and microservices architecture. Work with REST APIs and PostgreSQL databases.',                  'Mumbai',    'full-time',   600000,  1000000, 2, 1),
('React Frontend Developer',   'Build responsive web UIs using React.js, Redux, and modern JavaScript. Collaborate with backend teams on API integration.',                                           'Chennai',   'full-time',   500000,   900000, 1, 1),
('QA Automation Engineer',     'Write automated test scripts using Selenium and TestNG. Perform regression testing and maintain CI/CD pipelines.',                                                    'Hyderabad', 'full-time',   450000,   800000, 2, 1),
('Data Analyst',               'Analyze large datasets using SQL and Python. Create dashboards in Power BI and provide actionable insights to business teams.',                                       'Pune',      'full-time',   550000,   950000, 1, 1),
('Cloud Infrastructure Engineer','Design and manage AWS cloud infrastructure. Experience with EC2, S3, RDS, and CloudFormation required.',                                                            'Bangalore', 'full-time',   900000, 1500000, 3, 1);

-- Infosys (company_id = 2)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Node.js Developer',          'Build scalable backend services using Node.js and Express. Work with MongoDB and PostgreSQL. Knowledge of Docker is a plus.',                                         'Bangalore', 'full-time',   600000,  1100000, 2, 2),
('Python Developer',           'Develop automation scripts and data pipelines using Python. Experience with Django or Flask preferred.',                                                               'Pune',      'full-time',   550000,   950000, 1, 2),
('Business Analyst',           'Gather requirements from clients, create detailed BRDs and FRDs. Bridge communication between technical and business teams.',                                         'Mumbai',    'full-time',   700000,  1200000, 3, 2),
('DevOps Engineer',            'Manage CI/CD pipelines using Jenkins and GitLab. Experience with Kubernetes and Docker required.',                                                                    'Hyderabad', 'full-time',   800000,  1400000, 3, 2),
('UI/UX Designer',             'Create wireframes, prototypes, and high-fidelity designs using Figma. Conduct user research and usability testing.',                                                  'Bangalore', 'full-time',   600000,  1000000, 2, 2);

-- Wipro (company_id = 3)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Full Stack Developer',       'Work on both frontend (React) and backend (Node.js/Express) development. Build REST APIs and integrate with PostgreSQL.',                                             'Bangalore', 'full-time',   700000,  1300000, 2, 3),
('SAP Consultant',             'Implement and support SAP ERP modules including FICO and SD. Client-facing role with travel requirements.',                                                           'Mumbai',    'full-time',   900000,  1600000, 4, 3),
('Cybersecurity Analyst',      'Monitor network security, perform vulnerability assessments, and respond to incidents. CEH or CISSP certification preferred.',                                        'Chennai',   'full-time',   800000,  1400000, 3, 3),
('Mobile App Developer',       'Develop cross-platform mobile applications using React Native. Experience with REST APIs and push notifications.',                                                    'Noida',     'full-time',   650000,  1100000, 2, 3),
('Machine Learning Engineer',  'Build and deploy ML models using Python and TensorFlow. Experience with NLP or computer vision preferred.',                                                           'Bangalore', 'full-time',  1000000, 1800000, 3, 3);

-- HCL (company_id = 4)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Angular Developer',          'Build enterprise-grade single-page applications using Angular 14+. Work with TypeScript and RxJS.',                                                                   'Noida',     'full-time',   550000,   950000, 2, 4),
('Database Administrator',     'Manage PostgreSQL and Oracle databases. Perform query optimization, backup, and recovery operations.',                                                                'Chennai',   'full-time',   700000,  1200000, 3, 4),
('Scrum Master',               'Facilitate agile ceremonies, remove blockers, and ensure team follows Scrum practices. CSM certification preferred.',                                                 'Bangalore', 'full-time',   900000,  1500000, 4, 4),
('Technical Writer',           'Create technical documentation, API guides, and user manuals for software products.',                                                                                 'Pune',      'part-time',   300000,   500000, 1, 4),
('IT Support Engineer',        'Provide L1/L2 support to end users, manage tickets in ServiceNow, and troubleshoot hardware and software issues.',                                                   'Hyderabad', 'full-time',   350000,   600000, 1, 4);

-- Tech Mahindra (company_id = 5)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Telecom Engineer',           'Work on 5G network design and implementation. Knowledge of OSS/BSS systems required.',                                                                               'Pune',      'full-time',   700000,  1200000, 3, 5),
('Golang Developer',           'Develop high-performance microservices using Go. Experience with gRPC and message queues preferred.',                                                                  'Bangalore', 'full-time',   900000,  1600000, 3, 5),
('AI/ML Intern',               'Assist in building ML pipelines and data preprocessing tasks. Knowledge of Python, Pandas, and Scikit-learn required.',                                              'Pune',      'internship',  15000,    25000,  0, 5),
('Project Manager',            'Manage delivery of software projects end-to-end. PMP certified preferred. Experience with JIRA and Confluence.',                                                     'Mumbai',    'full-time',  1200000, 2000000, 6, 5),
('Blockchain Developer',       'Develop smart contracts using Solidity on Ethereum. Experience with Web3.js and Truffle framework.',                                                                  'Bangalore', 'full-time',  1100000, 1900000, 4, 5);

-- Razorpay (company_id = 6)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Backend Engineer',           'Build highly scalable payment infrastructure using Java and Go. Work on transaction processing systems handling millions of requests per day.',                       'Bangalore', 'full-time',  1200000, 2200000, 3, 6),
('Product Manager',            'Define product roadmap for Razorpay payment gateway. Work closely with engineering and design teams.',                                                                'Bangalore', 'full-time',  1500000, 2800000, 4, 6),
('Frontend Engineer',          'Build merchant-facing dashboards using React and TypeScript. Focus on performance and accessibility.',                                                                 'Bangalore', 'full-time',  1000000, 1800000, 2, 6),
('Data Engineer',              'Build and maintain data pipelines using Spark and Kafka. Experience with large-scale data warehousing.',                                                              'Bangalore', 'remote',     1100000, 2000000, 3, 6),
('Security Engineer',          'Conduct penetration testing and vulnerability assessments on payment systems. PCI-DSS compliance experience required.',                                               'Bangalore', 'full-time',  1300000, 2200000, 4, 6);

-- Swiggy (company_id = 8)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('iOS Developer',              'Develop and maintain the Swiggy iOS app using Swift. Experience with Core Data and async networking.',                                                                'Bangalore', 'full-time',   900000,  1700000, 3, 8),
('Android Developer',          'Build new features for Swiggy Android app. Strong Kotlin skills required along with MVVM architecture.',                                                             'Bangalore', 'full-time',   900000,  1700000, 3, 8),
('Supply Chain Analyst',       'Analyze delivery partner data and optimize delivery routes. Experience with SQL and Python.',                                                                         'Hyderabad', 'full-time',   700000,  1200000, 2, 8),
('SDE Intern',                 'Work on backend services for food ordering platform. Exposure to microservices and event-driven architecture.',                                                       'Bangalore', 'internship',  40000,    60000,  0, 8),
('Growth Marketing Manager',   'Drive user acquisition and retention strategies. Experience with performance marketing and A/B testing.',                                                             'Mumbai',    'full-time',  1000000, 1700000, 3, 8);

-- Zomato (company_id = 9)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Backend Developer - Go',     'Work on Zomato\'s core backend services using Golang. High-scale systems experience preferred.',                                                                     'Gurugram',  'full-time',  1000000, 1900000, 3, 9),
('Data Scientist',             'Build recommendation models for restaurant and food discovery. Experience with collaborative filtering and NLP.',                                                     'Gurugram',  'full-time',  1200000, 2200000, 3, 9),
('City Operations Manager',    'Manage delivery partner onboarding and city-level logistics operations. MBA preferred.',                                                                              'Delhi',     'full-time',   900000, 1500000, 3, 9),
('Content Writer',             'Create engaging food-related content for Zomato blog and social media. Part-time remote position.',                                                                  'Remote',    'part-time',   200000,   400000, 1, 9),
('Customer Support Lead',      'Lead a team of 15+ customer support agents. Improve NPS and CSAT scores for the platform.',                                                                          'Hyderabad', 'full-time',   700000, 1100000, 3, 9);

-- PhonePe (company_id = 11)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('SDE-2 Backend',              'Design scalable financial transaction systems. Strong DSA and system design skills required. Experience with Java or Go.',                                            'Bangalore', 'full-time',  1600000, 2800000, 4, 11),
('SDE-1 Backend',              'Build APIs for UPI payment flows. Node.js or Java backend experience. Freshers from top colleges also considered.',                                                  'Bangalore', 'full-time',   900000, 1500000, 1, 11),
('DevOps - Kubernetes',        'Manage production Kubernetes clusters on AWS. Terraform and Helm experience required.',                                                                               'Bangalore', 'full-time',  1400000, 2400000, 4, 11),
('Product Analyst',            'Analyze funnel metrics and payment success rates. SQL and Excel proficiency required.',                                                                               'Bangalore', 'full-time',   800000, 1400000, 2, 11),
('Legal Counsel',              'Handle regulatory compliance for fintech products. LLB required, RBI/SEBI regulation knowledge preferred.',                                                          'Bangalore', 'full-time',  1500000, 2500000, 5, 11);

-- CRED (company_id = 12)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Senior Product Designer',    'Design end-to-end product experiences for CRED app. Strong portfolio in mobile UX required.',                                                                        'Bangalore', 'full-time',  1400000, 2400000, 4, 12),
('Senior Backend Engineer',    'Work on credit scoring and lending tech. Strong system design knowledge and PostgreSQL expertise.',                                                                   'Bangalore', 'full-time',  1800000, 3200000, 5, 12),
('Marketing Intern',           'Support brand campaigns and performance marketing initiatives. MBA students preferred.',                                                                              'Bangalore', 'internship',  30000,    45000,  0, 12),
('Risk Analyst',               'Build and refine credit risk models using statistical methods and ML. Prior fintech experience preferred.',                                                           'Bangalore', 'full-time',  1200000, 2000000, 3, 12),
('Remote Node.js Developer',   'Fully remote role building CRED\'s partner integrations using Node.js and REST APIs.',                                                                              'Remote',    'remote',     1000000, 1800000, 2, 12);

-- Dream11 (company_id = 14)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Game Designer',              'Design fantasy sports game mechanics and scoring systems. Experience in gaming industry preferred.',                                                                   'Mumbai',    'full-time',  1000000, 1700000, 3, 14),
('Backend SDE - Real Time',    'Build real-time contest and scoring engines handling 10M+ concurrent users. Strong in Java/Go.',                                                                     'Mumbai',    'full-time',  1500000, 2700000, 4, 14),
('Sports Data Analyst',        'Collect and analyze cricket and football player performance data. SQL and Python skills required.',                                                                   'Mumbai',    'full-time',   900000, 1500000, 2, 14),
('SDE Intern - Full Stack',    'Work on admin panels and internal tools using React and Node.js.',                                                                                                   'Mumbai',    'internship',  35000,    55000,  0, 14),
('Infrastructure Engineer',    'Manage peak traffic infrastructure during IPL season spikes. AWS and auto-scaling expertise needed.',                                                                 'Mumbai',    'full-time',  1400000, 2400000, 4, 14);

-- Unacademy (company_id = 16)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('EdTech Content Developer',   'Create structured learning content for JEE and NEET preparation. Subject expertise in Physics or Chemistry required.',                                               'Bangalore', 'full-time',   600000,  1000000, 2, 16),
('Remote React Developer',     'Build interactive learning interfaces using React and WebRTC for live class features.',                                                                               'Remote',    'remote',      800000, 1400000, 2, 16),
('Video Production Intern',    'Assist in producing educational video content. Adobe Premiere Pro skills required.',                                                                                 'Bangalore', 'internship',  12000,    20000,  0, 16),
('Full Stack SDE',             'Work on Unacademy learning platform end-to-end. React + Node.js + PostgreSQL stack.',                                                                                'Bangalore', 'full-time',   900000, 1600000, 2, 16),
('Part-time Online Educator',  'Teach live sessions on your subject on Unacademy platform. Flexible hours remote position.',                                                                         'Remote',    'part-time',   200000,   600000, 0, 16);

-- Nykaa (company_id = 17)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('E-Commerce Manager',         'Manage product listings, pricing strategies, and catalog operations for Nykaa Fashion.',                                                                             'Mumbai',    'full-time',   900000, 1500000, 3, 17),
('Python Backend Developer',   'Build recommendation engines and catalog management APIs using Python and FastAPI.',                                                                                  'Mumbai',    'full-time',   900000, 1600000, 2, 17),
('Influencer Marketing Intern','Manage influencer partnerships and track campaign performance metrics.',                                                                                              'Mumbai',    'internship',  15000,    25000,  0, 17),
('Warehouse Ops Analyst',      'Optimize fulfillment center operations using data. Excel and SQL skills required.',                                                                                  'Delhi',     'full-time',   600000,  1000000, 2, 17),
('Senior iOS Developer',       'Lead iOS development for Nykaa shopping app. 4+ years Swift experience required.',                                                                                  'Mumbai',    'full-time',  1400000, 2200000, 4, 17);

-- MakeMyTrip (company_id = 20)
INSERT INTO jobs (title, description, location, job_type, salary_min, salary_max, experience_years, company_id) VALUES
('Travel Tech Engineer',       'Build flight and hotel booking APIs. Experience with third-party GDS integrations like Amadeus or Sabre preferred.',                                                 'Gurugram',  'full-time',  1000000, 1800000, 3, 20),
('React Developer',            'Develop responsive booking flow interfaces. Redux and performance optimization skills required.',                                                                     'Gurugram',  'full-time',   800000, 1400000, 2, 20),
('Revenue Manager',            'Optimize dynamic pricing strategies for hotel and flight inventory. Prior OTA experience preferred.',                                                                 'Gurugram',  'full-time',  1200000, 2000000, 4, 20),
('Remote Customer Experience', 'Handle escalations and improve customer support processes. Remote position with flexible shifts.',                                                                   'Remote',    'remote',      400000,   700000, 2, 20),
('SDE Intern',                 'Build internal tools for travel agents and support teams. Node.js and React exposure required.',                                                                     'Gurugram',  'internship',  25000,    40000,  0, 20);

-- =============================================
-- Step 4: Useful Queries
-- =============================================

-- All jobs with company name
-- SELECT j.id, j.title, c.name AS company, j.location, j.job_type, j.salary_min, j.salary_max
-- FROM jobs j JOIN companies c ON j.company_id = c.id
-- WHERE j.is_active = true ORDER BY j.posted_at DESC;

-- Filter by location
-- SELECT j.*, c.name AS company_name FROM jobs j
-- JOIN companies c ON j.company_id = c.id
-- WHERE j.location ILIKE '%bangalore%' AND j.is_active = true;

-- Filter by job_type
-- SELECT * FROM jobs WHERE job_type = 'remote' AND is_active = true;

-- Pagination (page 1, 10 per page)
-- SELECT j.*, c.name FROM jobs j JOIN companies c ON j.company_id = c.id
-- WHERE j.is_active = true ORDER BY j.posted_at DESC LIMIT 10 OFFSET 0;

-- Count for pagination
-- SELECT COUNT(*) FROM jobs WHERE is_active = true;

-- Jobs per city
-- SELECT location, COUNT(*) FROM jobs GROUP BY location ORDER BY count DESC;