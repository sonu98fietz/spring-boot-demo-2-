package com.sa.springbootmvcjspjpa.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sa.springbootmvcjspjpa.domain.User;
import com.sa.springbootmvcjspjpa.repository.UserRepository;

@Controller
public class UserController {
	
	@Autowired
	private UserRepository repository;

	// First request to the application
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("users", repository.findAll());
		return "index";
	}
	
	// Manage through further request to the application which is not the first request
			@GetMapping("list")
			public String showUpdateForm(Model model) {
				model.addAttribute("users", repository.findAll());
				return "index";
			}

			@GetMapping("addUser")
			public String addNewUserForm(User user, Model model) {
				User userObj = new User();
				model.addAttribute("user", userObj);
				model.addAttribute("formState", "Add User");
				return "add-user";
			}
			
			@PostMapping("add")
			public String saveUser(@ModelAttribute("user")User user, Model model) {
				repository.save(user); // inserting data into DB
				return "redirect:list";
			}
			
			@GetMapping("update")
			public String showUpdateForm(@RequestParam("id") long id, Model model) {
				User user = repository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
				model.addAttribute("user", user);
				model.addAttribute("formState", "Update User");
				return "add-user";
			}

//			@PostMapping("update")
//			public String updateUser(@RequestParam("id") long id, User user, Model model) {
//				
//				repository.save(user);
//				model.addAttribute("users", repository.findAll());
//				return "index";
//			}
			
			@GetMapping("delete")
			public String deleteUser(@RequestParam("id") long id, Model model) {
				User user = repository.findById(id)
						.orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
				repository.delete(user);
				model.addAttribute("users", repository.findAll());
				return "redirect:list";
			}
}
