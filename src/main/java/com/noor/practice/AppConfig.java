package com.noor.practice;



import com.noor.practice.config.persistancy.HibernateConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;

@Configuration
@ComponentScan(basePackages = {"com.noor.practice.config.security",
        "com.noor.practice.config.persistancy",
        "com.noor.practice.service" })
public class AppConfig {


    @Bean
    public StandardServletMultipartResolver multipartResolver(){
        return new StandardServletMultipartResolver();
    }

    @Bean
    public HibernateConfig getHibernateConfig(){
        return new HibernateConfig();
    }

    @Bean
    public GlobalExceptionHandler getGobalExcetionHandler(){
        return new GlobalExceptionHandler();
    }

    @Bean
    public PasswordEncoder PasswordEncoder(){
        return  new BCryptPasswordEncoder();
    }
}

