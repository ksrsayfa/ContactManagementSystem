-- ============================================================================
-- Contact Management System - SQL Schema & Data Dump
-- Generated for Database Management System LAB Submission
-- ============================================================================

CREATE TABLE contact_groups (
  group_id VARCHAR(10) PRIMARY KEY,
  group_name VARCHAR(50) NOT NULL,
  description VARCHAR(150)
);

CREATE TABLE contacts (
  contact_id VARCHAR(20) PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  phone VARCHAR(30) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  city VARCHAR(60) NOT NULL,
  group_id VARCHAR(10) NOT NULL,
  priority_score INT NOT NULL CHECK (priority_score >= 1 AND priority_score <= 100),
  is_favorite INTEGER NOT NULL DEFAULT 0 CHECK (is_favorite IN (0, 1)),
  FOREIGN KEY (group_id) REFERENCES contact_groups(group_id)
);

-- Contact Group Records
INSERT INTO contact_groups (group_id, group_name, description) VALUES ('CLT', 'Clients', 'Business clients and external partners');
INSERT INTO contact_groups (group_id, group_name, description) VALUES ('EMG', 'Emergency', 'Medical, security, and urgent contacts');
INSERT INTO contact_groups (group_id, group_name, description) VALUES ('FAM', 'Family', 'Immediate and extended family members');
INSERT INTO contact_groups (group_id, group_name, description) VALUES ('FRD', 'Friends', 'University and childhood friends');
INSERT INTO contact_groups (group_id, group_name, description) VALUES ('WRK', 'Work & Colleagues', 'Professional network and teammates');

-- Contact Records
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1001', 'Ariful Islam', '+880 1711-234561', 'ariful.islam@techbd.com', 'Dhaka', 'WRK', 92, 1);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1002', 'Nusrat Jahan', '+880 1819-345672', 'nusrat.jahan@gmail.com', 'Chittagong', 'FAM', 98, 1);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1003', 'Tariqul Hasan', '+880 1912-456783', 'tariqul.hasan@outlook.com', 'Feni', 'FRD', 78, 0);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1004', 'Sadia Rahman', '+880 1611-567894', 'sadia.rahman@finserve.io', 'Dhaka', 'CLT', 95, 1);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1005', 'Dr. Kamal Hossain', '+880 1715-678905', 'dr.kamal@cityhospital.org', 'Dhaka', 'EMG', 100, 1);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1006', 'Farhana Yasmin', '+880 1552-789016', 'farhana.yasmin@yahoo.com', 'Sylhet', 'FAM', 90, 1);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1007', 'Mehedi Hasan', '+880 1817-890127', 'mehedi.dev@softworks.com', 'Rajshahi', 'WRK', 84, 0);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1008', 'Jannatul Ferdous', '+880 1713-901238', 'jannatul.f@univ.edu', 'Comilla', 'FRD', 72, 0);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1009', 'Rafiul Alam', '+880 1911-012349', 'rafiul.alam@globaltrade.com', 'Chittagong', 'CLT', 88, 0);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1010', 'Maliha Chowdhury', '+880 1612-123450', 'maliha.c@designstudio.co', 'Dhaka', 'WRK', 81, 0);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1011', 'Nayeem Uddin', '+880 1718-234569', 'nayeem.uddin@gmail.com', 'Khulna', 'FRD', 65, 0);
INSERT INTO contacts (contact_id, full_name, phone, email, city, group_id, priority_score, is_favorite) VALUES ('CNT-1012', 'Feni Sadar Helpline', '+880 1711-999888', 'emergency@fenisadar.gov.bd', 'Feni', 'EMG', 99, 1);

-- Aggregate Summary Queries Used in Application
SELECT COUNT(*) AS total_contacts, SUM(is_favorite) AS favorite_contacts, ROUND(AVG(priority_score), 1) AS avg_priority, MAX(priority_score) AS max_priority FROM contacts;
