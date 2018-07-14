package com.coderef.delivery.controller;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class AuthController {

    @RequestMapping("/user")
    public Principal getCurrentLoggedInUser(Principal user) {
        return user;
    }
    
    @RequestMapping("/teste")
    public Principal teste(Principal user) {
        return user;
    }
    
    @RequestMapping("/login")
    public String greeting(@RequestParam(name="username", required=true) String username,
    		@RequestParam(name="password", required=true) String password, Model model) {
        
        return "greeting";
    }
}
