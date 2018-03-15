package com.jk.controller.test;

import com.jk.service.test.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("test")
public class TestController {

    @Autowired
    private TestService testService;

    @RequestMapping("test")
    public void getCount(){
        int count=testService.getCount();
        System.out.println(count);
    }

    @RequestMapping("toshowMain")
    public String toshowMain(){
        return "showmain";
    }
}
