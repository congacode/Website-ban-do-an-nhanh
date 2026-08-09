SET FOREIGN_KEY_CHECKS=0;
DELETE FROM category;
INSERT INTO category (id, cate_name, create_date) VALUES 
(1, 'Món chay', NOW()),
(2, 'Món mặn', NOW()),
(3, 'Món lẩu', NOW()),
(4, 'Món ăn vặt', NOW()),
(5, 'Món tráng miệng', NOW()),
(6, 'Nước uống', NOW());
UPDATE product SET category_id = 4 WHERE title LIKE '%Pizza%';
UPDATE product SET category_id = 6 WHERE title LIKE '%Trà sữa%';
SET FOREIGN_KEY_CHECKS=1;
