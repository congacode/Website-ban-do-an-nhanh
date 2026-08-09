package com.foodproject.fooddelivery.controller;

import ch.qos.logback.core.model.Model;
import com.foodproject.fooddelivery.entity.Users;
import com.foodproject.fooddelivery.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ViewController {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping({"", "/", "/index"})
    public String showHome() {
        return "index";
    }

    @GetMapping("/admin")
    public String showAdmin() {
        return "admin";
    }

    @GetMapping("/fix-admin")
    @ResponseBody
    public String fixAdmin(@org.springframework.web.bind.annotation.RequestParam(required = false, defaultValue = "admin123") String pass) {
        try {
            Users admin = usersRepository.findFirstByUserNameOrEmail("admin@gmail.com", "admin@gmail.com");
            if (admin != null) {
                boolean match = passwordEncoder.matches(pass, admin.getPassword());
                return "DB Hash: " + admin.getPassword() + "<br>Match with '" + pass + "': " + match;
            }
            return "Admin null";
        } catch (Exception e) {
            return "Error: " + e.getMessage();
        }
    }
}
