package com.violeta.eliz.ads;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;


@SpringBootApplication
public class AdsApplication {

	public static void main(String[] args) {
		SpringApplication.run(AdsApplication.class, args);
	}

	@Bean
	public JavaMailSender getJavaMailSender() {
		var mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);
		mailSender.setUsername("fecapads@gmail.com");
		mailSender.setPassword("ealwxqakkbbhbohf");
		var props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.mime.address.strict", "false");

		return mailSender;
	}

}
