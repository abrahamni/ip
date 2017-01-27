-------------------------------
-- super user, languages
-------------------------------
BEGIN;
INSERT INTO users VALUES (1, 'admin', '$2a$10$wX8F6RVwPyfSnZ/f.snkjeHcwFP8XDoXGNi1WwwoO0wuHRHlH0gja', 1, null, null, '{}');
INSERT INTO users VALUES (2, 'council-1', '$2a$10$LDLRb7Paht5tyW9fmJInB.5jiOBKtbXB1KkYOHsi5OSomQW4vnaOK', 150, null, null, '{ "is_council": true, "council_email": "info@projectname.org" }');
INSERT INTO users VALUES (3, 'council-2', '$2a$10$LDLRb7Paht5tyW9fmJInB.5jiOBKtbXB1KkYOHsi5OSomQW4vnaOK', 150, null, null, '{ "is_council": true }');
INSERT INTO users VALUES (4, 'council-3', '$2a$10$LDLRb7Paht5tyW9fmJInB.5jiOBKtbXB1KkYOHsi5OSomQW4vnaOK', 150, null, null, '{ "is_council": true }');
INSERT INTO users VALUES (5, 'council-4', '$2a$10$LDLRb7Paht5tyW9fmJInB.5jiOBKtbXB1KkYOHsi5OSomQW4vnaOK', 150, null, null, '{ "is_council": true }');
INSERT INTO users VALUES (6, 'council-5', '$2a$10$LDLRb7Paht5tyW9fmJInB.5jiOBKtbXB1KkYOHsi5OSomQW4vnaOK', 150, null, null, '{ "is_council": true }');
INSERT INTO users VALUES (7, 'council-6', '$2a$10$LDLRb7Paht5tyW9fmJInB.5jiOBKtbXB1KkYOHsi5OSomQW4vnaOK', 150, null, null, '{ "is_council": true }');
UPDATE languages SET enabled = true WHERE code = 'fa' OR code = 'en';
COMMIT;



-------------------------------
-- ui_translations
-------------------------------
BEGIN;
INSERT INTO ui_translations (lang, t_group, t_key, t_value) VALUES
('en', 'website', 'title', 'Project Name'), 
('en', 'website', 'form-success-message-heading', 'Thank you!'),
('en', 'website', 'form-success-message', 'Your report has been submitted and after validation it will appear on the website.'),
('en', 'website', 'empty-fields', 'All fields are required.'),
('en', 'website', 'map-caption-all-items', 'All categories'),
('en', 'website', 'all-reports', 'All reports'),
('en', 'website', 'homepage', 'Home'), 
('en', 'website', 'about', 'About'), 
('en', 'website', 'browse-reports', 'Browse Reports'), 
('en', 'website', 'latest-reports', 'Latest Reports'), 
('en', 'website', 'back-to-reports-browser', '&larr; Back to reports'), 
('en', 'website', 'submit-report', 'Submit Report'), 
('en', 'website', 'update-report', 'Update Report'), 
('en', 'website', 'optional', 'Optional'), 
('en', 'website', 'apply-range', 'Apply range'), 
('en', 'website', 'load-more', 'Load more'), 
('en', 'website', 'search-reports', 'Type to search...'), 
('en', 'website', 'submit', 'Submit'), 
('en', 'website', 'cancel', 'Cancel'), 
('en', 'website', 'close', 'Close'), 
('en', 'website', 'status', 'Status:'), 
COMMIT;



-------------------------------
-- forms, form_translations, form_sections, form_section_translations
-------------------------------
BEGIN;
INSERT INTO forms VALUES (1, now(), now(), '{}', 1, 0);
INSERT INTO form_translations VALUES (1, 'en', 'Project Name', null);
INSERT INTO form_sections VALUES (1, 1, 0, '{}', 1);
INSERT INTO form_section_translations VALUES (1, 'en', 'Default section', null);
COMMIT;



-------------------------------
--  form_items, form_item_translations
-------------------------------
BEGIN;
INSERT INTO form_items VALUES (1, 1, 1, 0, 4, '{ "allow_multiple": false, "categorization_item": true }', 0);
INSERT INTO form_item_translations VALUES (1, 'en', 'Category', 'Please select what type of issue are you reporting.', null);
INSERT INTO form_items VALUES (2, 1, 1, 0, 1, '{ "content_role": "title" }', 0);
INSERT INTO form_item_translations VALUES (2, 'en', 'Title', null, null);
INSERT INTO form_items VALUES (3, 1, 1, 0, 1, '{ "content_role": "description", "multiline": true }', 0);
INSERT INTO form_item_translations VALUES (3, 'en', 'Description', 'Please describe the issue in details.', null);
INSERT INTO form_items VALUES (4, 1, 1, 0, 8, '{ "optional": true }', 0);
INSERT INTO form_item_translations VALUES (4, 'en', 'Photo', null, null);
INSERT INTO form_items VALUES (5, 1, 1, 0, 4, '{ "allow_multiple": false, "linked_to_council": true }', 0);
INSERT INTO form_item_translations VALUES (5, 'en', 'Specification', null, null);
INSERT INTO form_items VALUES (6, 1, 1, 0, 6, '{}', 0);
INSERT INTO form_item_translations VALUES (6, 'en', 'Exact location', 'Use search or drag the map to point exact location with a marker.', null);
INSERT INTO form_items VALUES (7, 1, 1, 0, 1, '{ "optional": true }', 0);
INSERT INTO form_item_translations VALUES (7, 'en', 'Additional address details', null, null);
INSERT INTO form_items VALUES (8, 1, 1, 0, 4, '{ "allow_multiple": false, "hidden_from_map": true, "hidden_from_public": true }', 0);
INSERT INTO form_item_translations VALUES (8, 'en', 'Contact details', null, null);
INSERT INTO form_items VALUES (9, 1, 1, 8, 1, '{ "show_if": 14, "hidden_from_public": true }', 0);
INSERT INTO form_item_translations VALUES (9, 'en', 'Your full name', null, null);
INSERT INTO form_items VALUES (10, 1, 1, 8, 1, '{ "show_if": 14, "hidden_from_public": true }', 0);
INSERT INTO form_item_translations VALUES (10, 'en', 'Your email address', null, null);
-- INSERT INTO form_items VALUES (11, 1, 1, 8, 1, '{ "show_if": 14, "hidden_from_public": true }', 0);
-- INSERT INTO form_item_translations VALUES (11, 'en', 'Your contact number', null, null);
COMMIT;



-------------------------------
-- form_item_options, form_item_option_translations
-------------------------------
BEGIN;
INSERT INTO form_item_options VALUES (1, 1, 1, 1, 1, 0, '{ "icon": "issue1" }', 1);
INSERT INTO form_item_option_translations VALUES (1, 'en', 'Issue1');
INSERT INTO form_item_options VALUES (2, 1, 1, 1, 2, 0, '{ "icon": "issue2" }', 1);
INSERT INTO form_item_option_translations VALUES (2, 'en', 'Issue2');
INSERT INTO form_item_options VALUES (7, 1, 1, 5, 1, 0, '{ "linked_council_id": 2 }', 1);
INSERT INTO form_item_option_translations VALUES (7, 'en', 'Central');
INSERT INTO form_item_options VALUES (8, 1, 1, 5, 2, 0, '{ "linked_council_id": 3 }', 1);
INSERT INTO form_item_option_translations VALUES (8, 'en', 'ABCD');
INSERT INTO form_item_options VALUES (9, 1, 1, 5, 3, 0, '{ "linked_council_id": 4 }', 1);
INSERT INTO form_item_option_translations VALUES (9, 'en', 'EFGH');
INSERT INTO form_item_options VALUES (13, 1, 1, 8, 1, 0, '{}', 1);
INSERT INTO form_item_option_translations VALUES (13, 'en', 'I want to stay anonymous');
INSERT INTO form_item_options VALUES (14, 1, 1, 8, 2, 0, '{}', 1);
INSERT INTO form_item_option_translations VALUES (14, 'en', 'I want to share my contact information');
COMMIT;
