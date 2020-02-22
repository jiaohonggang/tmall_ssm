package cn.wmyskxz.controller;

import cn.wmyskxz.pojo.OrderItem;
import cn.wmyskxz.service.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * 专门用于前台页面跳转的控制器
 *
 * @author: @jim
 * @create: 2018-05-03-下午 15:03
 */
@Controller
@RequestMapping("")
public class PageController {
	@Autowired
	OrderItemService orderItemService;

	@RequestMapping("/loginPage")
	public String loginPage() {
		return "loginPage";
	}

	@RequestMapping("/registerSuccessPage")
	public String registerSuccessPage() {
		return "registerSuccessPage";
	}

	@RequestMapping("/registerPage")
	public String registerPage() {
		return "registerPage";//访问/WEB-INF/views/registerPage.jsp
	}

	@RequestMapping("/test")
	public String testPage(Model model) {
		List<OrderItem> orderItems = orderItemService.getByOrderId(1);
		model.addAttribute("orderItems", orderItems);
		return "buyPage";
	}

	@RequestMapping("/payPage")
	public String payPage() {
		return "alipay";
	}

	@RequestMapping("/admin")
	public String admin() {
		System.out.println("执行了后端admin！");
		return "admin/index";
	}
}
