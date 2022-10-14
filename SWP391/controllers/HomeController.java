package com.springmvc.demo.controllers;

import com.springmvc.demo.models.Account;
import com.springmvc.demo.repositories.InsuranceCardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "home")
public class HomeController {
//    http://localhost:8083/home
    @Autowired
    InsuranceCardRepository insuranceCardRepository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String GetIntoJSP(ModelMap modelMap
    ) {
        modelMap.addAttribute("velist",insuranceCardRepository.findAllBytypecard("Vehicle Insurance","enable"));
        modelMap.addAttribute("prolist",insuranceCardRepository.findAllBytypecard("Property Insurance","enable"));
        modelMap.addAttribute("bulist",insuranceCardRepository.findAllBytypecard("Business Insurance","enable"));
        modelMap.addAttribute("adlist",insuranceCardRepository.findAllBytypecard("Additional Insurance","enable"));
        modelMap.addAttribute("hellist",insuranceCardRepository.findAllBytypecard("Health Insurance","enable"));
        modelMap.addAttribute("lifelist",insuranceCardRepository.findAllBytypecard("Life Insurance","enable"));
        return "home";
    }

}
