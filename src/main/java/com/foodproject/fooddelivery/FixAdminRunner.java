package com.foodproject.fooddelivery;

import com.foodproject.fooddelivery.entity.Users;
import com.foodproject.fooddelivery.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class FixAdminRunner implements CommandLineRunner {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(String... args) throws Exception {
        Users admin = usersRepository.findFirstByEmail("admin@gmail.com");
        if(admin != null) {
            admin.setPassword(passwordEncoder.encode("admin123"));
            usersRepository.save(admin);
            System.out.println("=========================================================");
            System.out.println(" ĐÃ ĐẶT LẠI MẬT KHẨU ADMIN THÀNH CÔNG: admin123 ");
            System.out.println("=========================================================");
        }
    }
}
