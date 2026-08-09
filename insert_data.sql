-- 1. Thêm Role ADMIN vào bảng roles
INSERT INTO roles (role_name) 
SELECT 'ADMIN' FROM DUAL 
WHERE NOT EXISTS (SELECT * FROM roles WHERE role_name = 'ADMIN');

-- 2. Thêm tài khoản Admin vào bảng users
-- Lưu ý: Mật khẩu 'admin123' đã được mã hóa BCrypt vì Spring Security trong code của bạn dùng BCryptPasswordEncoder.
-- Email đăng nhập: admin@gmail.com | Mật khẩu: admin123
INSERT INTO users (email, password, full_name, status, user_type, create_code_at, join_date, phone, verify_code)
VALUES (
    'admin@gmail.com', 
    '$2a$10$wYMeo7H705nE9/ntXWd8/u306wXk32Y/.fL8b1QJq7u5o1VfQ9v8a', 
    'Quản trị viên', 
    1, 
    (SELECT id FROM roles WHERE role_name = 'ADMIN' LIMIT 1),
    NOW(),
    DATE_FORMAT(NOW(), '%Y-%m-%d'),
    '0123456789',
    NULL
);

-- 3. Thêm một số Danh mục (Category)
INSERT INTO category (cate_name, create_date) VALUES ('Đồ ăn nhanh', NOW());
INSERT INTO category (cate_name, create_date) VALUES ('Đồ uống', NOW());

-- 4. Thêm Thực đơn (Product)
-- Sản phẩm 1 thuộc Đồ ăn nhanh
INSERT INTO product (title, description, price, status, image_url, category_id)
VALUES (
    'Pizza Bò Phô Mai', 
    'Pizza bò bằm phô mai siêu ngon, đế dày xốp.', 
    150000, 
    1, 
    'https://res.cloudinary.com/demo/image/upload/v1312461204/sample.jpg', 
    (SELECT id FROM category WHERE cate_name = 'Đồ ăn nhanh' LIMIT 1)
);

-- Sản phẩm 2 thuộc Đồ uống
INSERT INTO product (title, description, price, status, image_url, category_id)
VALUES (
    'Trà Sữa Trân Châu', 
    'Trà sữa ô long trân châu đen truyền thống.', 
    45000, 
    1, 
    'https://res.cloudinary.com/demo/image/upload/v1312461204/sample.jpg', 
    (SELECT id FROM category WHERE cate_name = 'Đồ uống' LIMIT 1)
);
