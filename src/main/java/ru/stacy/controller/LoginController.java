package ru.stacy.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.stacy.object.User;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Locale;

@Controller
public class LoginController {
    public LoginController() {}

    private static final int WEAK_STRENGTH = 1;
    private static final int FEAR_STRENGTH = 5;
    private static final int STRONG_STRENGTH = 7;

    private static final String WEAK_COLOR = "#FF0000";
    private static final String FEAR_COLOR = "#FF9900";
    private static final String STRENGTH_COLOR = "#0099CC";

    @Autowired
    private MessageSource messageSource;

    @ModelAttribute
    public User createNewUser() {
        return new User();
    }

    @RequestMapping(value = "/check-strength", method = RequestMethod.GET, produces = {"text/html; charset=UTF-8"})
    public @ResponseBody String checkStrength(@RequestParam String password) {
        String result = "<span style=\"color:%s; font-weight: bold;\">%s</span>";

        if(password.length() >= WEAK_STRENGTH & password.length() < FEAR_STRENGTH) {
            return String.format(result, WEAK_COLOR, "Слабый");
        } else if(password.length() >= FEAR_STRENGTH & password.length() < STRONG_STRENGTH) {
            return String.format(result, FEAR_COLOR, "Средний");
        } else if(password.length() >= STRONG_STRENGTH) {
            return String.format(result, STRENGTH_COLOR, "Сильный");
        }
        return "";
    }


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main(@ModelAttribute User user, HttpSession session, Locale locale) {
        System.out.println(locale.getDisplayLanguage());
        System.out.println(messageSource.getMessage("locale", new String[] {locale.getDisplayName(locale)}, locale));
        return "login";
    }

    @RequestMapping(value = "/check-user", method = RequestMethod.POST)
    public ModelAndView checkUser(Locale locale, @Valid @ModelAttribute("user") User user, BindingResult bindingResult, Model model, ModelMap modelMap) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("locale", messageSource.getMessage("locale", new String[] {locale.getDisplayName(locale)}, locale));

        if(bindingResult.hasErrors()) {
            modelAndView.setViewName("login");
        } else {
            modelAndView.setViewName("main");
        }

        return modelAndView;
    }

    @RequestMapping(value = "/downloadPDF", method = RequestMethod.GET)
    public ModelAndView downloadPDF() {
        return new ModelAndView("pdfView");
    }

    // http://localhost:8087/get-json-user/alex/true
    @RequestMapping(value = "/get-json-user/{name}/{admin}", method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public User getJsonUser(@PathVariable("name") String name, @PathVariable("admin") boolean admin) {
        User user = new User();
        user.setName(name);
        user.setAdmin(admin);
        return user;
    }

    @RequestMapping(value = "/put-json-user", method = RequestMethod.POST, consumes = "application/json")
    public ResponseEntity<String> setJsonUser(@RequestBody User user) {
        return new ResponseEntity<String>(HttpStatus.OK);
    }
}
