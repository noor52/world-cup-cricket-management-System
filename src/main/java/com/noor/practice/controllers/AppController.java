package com.noor.practice.controllers;


//
//import com.fardoushlab.iccweb.dtos.UserDto;
//import com.fardoushlab.iccweb.models.Role;
//import com.fardoushlab.iccweb.models.User;
//import com.fardoushlab.iccweb.request_models.Country;
//import com.fardoushlab.iccweb.request_models.Stat;
//import com.fardoushlab.iccweb.services.*;
//import com.fardoushlab.iccweb.util.Util;
//import org.springframework.beans.BeanUtils;
import com.noor.practice.Util.Util;
import com.noor.practice.dtos.UserDto;
import com.noor.practice.model.Country;
import com.noor.practice.model.Role;
import com.noor.practice.model.User;
import com.noor.practice.request_model.Stat;
import com.noor.practice.service.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.RollbackException;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.EnumSet;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@Controller
public class AppController {

    @Autowired
    UserService userService;

    @Autowired
    CountryService countryService;

    @Autowired
    TeamService teamService;

        @Autowired
        PlayerService playerService;

    @Autowired
    StaffService staffService;

    @Autowired
    PasswordEncoder passwordEncoder;


    @GetMapping("/")
    public String getHomePage(Model model) {

        return "redirect:/index";
    }


    private com.noor.practice.request_model.User getCurrentUser(Authentication authentication) {
        UserDto userDto = userService.getUserDtoByName(authentication.getName());

        com.noor.practice.request_model.User user = new com.noor.practice.request_model.User();
        user.setId(userDto.getId());
        user.setName(userDto.getName());
        user.setRole(Util.getStringRole(userDto.getRole()));
        user.setProfilePictureUrl(userDto.getProfilePictureUrl());

        return user;
    }

    private Stat getStats(){
        Stat stat = new Stat();
        stat.setTotalCountry(countryService.countTotalcountry());
        stat.setActiveCountry(countryService.countActivecountry());
        stat.setInActiveCountry(stat.getTotalCountry() - stat.getActiveCountry());
        stat.setTotalTeam(teamService.countTotalTeam());
        stat.setActiveTeam(teamService.countActiveTeam());
        stat.setInactiveTeam(stat.getTotalTeam() - stat.getActiveTeam());
        stat.setTotalCoach(staffService.countTotalStaff() );
        stat.setActiveCoach(staffService.countActiveStaff());
        stat.setInActiveCoach(stat.getTotalCoach() - stat.getActiveCoach());
        stat.setTotalPlayer(playerService.countTotalPlayer());
        stat.setActivePlayer(playerService.countActivePlayer());
        stat.setInActivePlayer(stat.getTotalPlayer() - stat.getActivePlayer());
        stat.setTotalUser(userService.countTotalUser());
        stat.setActiveUser(userService.countActiveUser());
        stat.setInActiveUser(stat.getTotalUser() - stat.getActiveUser());

        System.out.println("stats: "+stat.toString());
        return stat;
    }

    @GetMapping("/index")
    public String getIndexPage(Model model, Authentication auth){

        var countryList = new ArrayList<Country>();
        countryService.getAllCountry().forEach(country->{
            var countryRm = new Country();
            BeanUtils.copyProperties(country,countryRm);
            countryList.add(countryRm);

        });

        model.addAttribute("stat", getStats());
        model.addAttribute("user",getCurrentUser(auth));
        model.addAttribute("country", new Country());
        model.addAttribute("countryList",countryList);

        return "index";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model, @RequestParam(name = "error", required = false) Boolean error) {

        genereateUser();

        model.addAttribute("error", error);

        return "auth/login";
    }

    public void genereateUser() {

        if (!userService.isUserExists("Admin")) {
            User superUser = new User();
            superUser.setName("Admin");
            superUser.setPassword(passwordEncoder.encode("asecret"));
            superUser.setActive(true);
            superUser.setRole(Role.ROLE_SUPER_ADMIN);
            superUser.setProfilePictureUrl("/profile/images/default_profile.jpg");
            userService.saveUser(superUser);
        }

    }


    @GetMapping("/user/add")
    public String getRegisterPage(Model model, @RequestParam(name = "error", required = false) Boolean error) {

        List<String> roles = new ArrayList<>(Arrays.asList("USER", "PLAYER"));
        model.addAttribute("error", error);
        model.addAttribute("user", new com.noor.practice.request_model.User());
        model.addAttribute("role_list", roles);


        return "auth/register";
    }
    @PostMapping("/user/add")
    public String addNewCountry(Model model, @RequestParam(name = "user") String user){

        countryService.addCountry(user);
        model.addAttribute("message","user Saved Successfully");
        return "redirect:/auth/login";
    }
    @GetMapping("/403")
    public String _403() {
        return "403";
    }
}
