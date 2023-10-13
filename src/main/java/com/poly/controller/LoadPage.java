package com.poly.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.ProductDAO;
import com.poly.dao.ShoppingCartDAO;
import com.poly.entity.Product;

import com.poly.service.SessionService;



@Controller
public class LoadPage {
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	private ShoppingCartDAO shoppingCartDAO;
	@Autowired
	SessionService sessionService;
	@Autowired
	ProductDAO productDAO;

	@GetMapping({  "/contact.html", "/about.html"})
	public String loadPage(HttpServletRequest request) {
		String path = request.getServletPath();

		if ("/contact.html".equals(path)) {
			return "contact";

		} else if ("/about.html".equals(path)) {
			return "about";
		}
		return "error";
	}
	
	@RequestMapping({"/","index.html"})
	public String index(Model model) {
		List<Product> pro = productDAO.topProduct();
		
		List<Product> proa = productDAO.findByDiscount();
		model.addAttribute("pro", pro);
		
		model.addAttribute("proa", proa);
		sessionService.setAttribute("cartQuantity", shoppingCartDAO.getCount());
		return "index";
	}

	}

	

	


