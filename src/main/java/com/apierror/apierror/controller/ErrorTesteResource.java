package com.apierror.apierror.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ErrorTesteResource {


    @GetMapping("/hello")
    public String hello(){
        return "Hello";
    }

    @GetMapping("/error")
    public void sendError() {
        System.out.println("SIMULANDO ERRO MESSAGE");
        throw new OtelErroException("SIMULANDO ERRO MESSAGE");
    }
   
    private static class OtelErroException extends RuntimeException {
        public OtelErroException(String error) {
            super(error);
        }
    }
}

