# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    skills_id INT NOT NULL AUTO_INCREMENT,
    skills_name VARCHAR(255) NOT NULL,
    skills_description VARCHAR(255) NOT NULL,
    skills_tag VARCHAR(255) NOT NULL,
    skills_url VARCHAR(255) DEFAULT NULL,
    skills_time_commitment VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_name, skills_description, skills_tag, skills_url, skills_time_commitment) VALUES
('Web Development', 'Building and maintaining websites, mastering front and back-end technologies.', 'Skill 1', 'https://example-webdev.com', '200 hours to proficiency'),
('Creative Writing', 'Expressing ideas and stories effectively through written language.', 'Skill 2', 'https://example-creativewriting.com', 'Varies with style and practice'),
('Cybersecurity Basics', 'Protecting systems and networks from digital attacks.', 'Skill 3', 'https://example-cybersecurity.com', '100 hours for fundamentals'),
('Public Speaking', 'Engaging and delivering speeches to a variety of audiences.', 'Skill 4', 'https://example-publicspeaking.com', '50 hours to confidence'),
('3D Modeling', 'Creating three-dimensional representations of objects using software.', 'Skill 5', 'https://example-3dmodeling.com', '150 hours to intermediate level'),
('Video Editing', 'Cutting, splicing, and mastering the art of video production.', 'Skill 6', 'https://example-videoediting.com', '100 hours to edit like a pro'),
('Game Development', 'Designing interactive games for entertainment and education.', 'Skill 7', 'https://example-gamedev.com', '500 hours to build your first game'),
('Mobile App Design', 'Crafting aesthetically pleasing and functional mobile applications.', 'Skill 8', 'https://example-appdesign.com', '300 hours for a solid portfolio');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(255) DEFAULT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) DEFAULT NULL,
    linkedin_url VARCHAR(255) DEFAULT NULL,
    headshot_url VARCHAR(255) DEFAULT NULL,
    discord_handle VARCHAR(255) DEFAULT NULL,
    brief_bio TEXT DEFAULT NULL,
    date_joined DATE NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

#insert into people (people_id,people_last_name) values (1,'Person 1');
INSERT INTO people (first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
('John', 'Person 1', 'john1@example.com', 'http://linkedin.com/in/john1', 'http://example.com/headshots/1.jpg', 'john1#0001', 'A dedicated software engineer with a passion for solving complex problems and contributing to open-source projects.', '2021-01-10'),
('Emma', 'Person 2', 'emma2@example.com', 'http://linkedin.com/in/emma2', 'http://example.com/headshots/2.jpg', 'emma2#0002', 'Marketing guru with an eye for market trends and a talent for creating compelling brand stories.', '2021-02-15'),
('Liam', 'Person 3', 'liam3@example.com', 'http://linkedin.com/in/liam3', 'http://example.com/headshots/3.jpg', 'liam3#0003', 'Financial analyst well-versed in risk management and investment strategies.', '2021-03-22'),
('Olivia', 'Person 4', 'olivia4@example.com', 'http://linkedin.com/in/olivia4', 'http://example.com/headshots/4.jpg', 'olivia4#0004', 'Creative director with a strong background in graphic design and brand development.', '2021-04-30'),
('Noah', 'Person 5', 'noah5@example.com', 'http://linkedin.com/in/noah5', 'http://example.com/headshots/5.jpg', 'noah5#0005', 'Project manager with a proven record of leading cross-functional teams to deliver innovative solutions on time and on budget.', '2021-06-01'),
('Ava', 'Person 6', 'ava6@example.com', 'http://linkedin.com/in/ava6', 'http://example.com/headshots/6.jpg', 'ava6#0006', 'Entrepreneur and business strategist focused on technology startups and scalable growth.', '2021-07-08'),
('William', 'Person 7', 'william7@example.com', 'http://linkedin.com/in/william7', 'http://example.com/headshots/7.jpg', 'william7#0007', 'Experienced software developer with a strong focus on mobile application development and UX design.', '2021-08-14'),
('Sophia', 'Person 8', 'sophia8@example.com', 'http://linkedin.com/in/sophia8', 'http://example.com/headshots/8.jpg', 'sophia8#0008', 'Data scientist with expertise in machine learning, data mining, and making data-driven decisions to influence business outcomes.', '2021-09-20'),
('James', 'Person 9', 'james9@example.com', 'http://linkedin.com/in/james9', 'http://example.com/headshots/9.jpg', 'james9#0009', 'Security specialist with extensive experience in network security and threat analysis.', '2021-10-26'),
('Charlotte', 'Person 10', 'charlotte10@example.com', 'http://linkedin.com/in/charlotte10', 'http://example.com/headshots/10.jpg', 'charlotte10#0010', 'Digital media expert specializing in content creation, social media marketing, and brand consulting.', '2021-12-05');



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.
CREATE TABLE peopleskills (
    peopleskills_id INT NOT NULL AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (peopleskills_id),
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

 -- Populating peopleskills table
INSERT INTO peopleskills (skills_id, people_id, date_acquired) VALUES
(1, 1, '2021-06-01'),
(3, 1, '2021-07-15'),
(6, 1, '2021-08-10'),

(3, 2, '2020-03-01'),
(4, 2, '2020-04-12'),
(5, 2, '2020-05-09'),

(1, 3, '2019-11-01'),
(5, 3, '2019-12-15'),

-- Person 4 has no skills, so no entries for Person 4

(3, 5, '2018-01-20'),
(6, 5, '2018-02-22'),

(2, 6, '2017-07-03'),
(3, 6, '2017-08-19'),
(4, 6, '2017-09-05'),

(3, 7, '2022-03-10'),
(5, 7, '2022-04-17'),
(6, 7, '2022-05-21'),

(1, 8, '2021-02-28'),
(3, 8, '2021-04-15'),
(5, 8, '2021-05-30'),
(6, 8, '2021-07-01'),

(2, 9, '2020-10-13'),
(5, 9, '2020-11-23'),
(6, 9, '2020-12-11'),

(1, 10, '2023-01-09'),
(4, 10, '2023-02-07'),
(5, 10, '2023-03-18');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
CREATE TABLE roles (
    roles_id INT NOT NULL AUTO_INCREMENT,
    roles_name VARCHAR(255) NOT NULL,
    roles_sort_priority INT NOT NULL,
    PRIMARY KEY (roles_id)
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)
INSERT INTO roles (roles_name, roles_sort_priority) VALUES
('Designer', 10),
('Developer', 20),
('Recruit', 30),
('Team Lead', 40),
('Boss', 50),
('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id INT NOT NULL AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (peopleroles_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(roles_id)
);



# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, CURDATE()), -- Person 1 is a Developer
(2, 5, CURDATE()), -- Person 2 is a Boss
(2, 6, CURDATE()), -- Person 2 is also a Mentor
(3, 2, CURDATE()), -- Person 3 is a Developer
(3, 4, CURDATE()), -- Person 3 is also a Team Lead
(4, 3, CURDATE()), -- Person 4 is a Recruit
(5, 3, CURDATE()), -- Person 5 is a Recruit
(6, 2, CURDATE()), -- Person 6 is a Developer
(6, 1, CURDATE()), -- Person 6 is also a Designer
(7, 1, CURDATE()), -- Person 7 is a Designer
(8, 1, CURDATE()), -- Person 8 is a Designer
(8, 4, CURDATE()), -- Person 8 is also a Team Lead
(9, 2, CURDATE()), -- Person 9 is a Developer
(10, 2, CURDATE()), -- Person 10 is a Developer
(10, 1, CURDATE()); -- Person 10 is also a Designer

