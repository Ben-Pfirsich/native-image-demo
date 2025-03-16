package de.bp.NativeImageDemo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {


    @GetMapping("/")
    public String helloGraal() {
        return "Hello Graal!";
    }
}
