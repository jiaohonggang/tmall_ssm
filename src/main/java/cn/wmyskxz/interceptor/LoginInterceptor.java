package cn.wmyskxz.interceptor;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.wmyskxz.pojo.User;

/**
 * 登录拦截器：
 *
 * @author: @jim
 * @create: 2018-05-02-下午 19:28
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 在业务处理器处理请求之前被调用 - 如果返回false 从当前的拦截器往回执行所有拦截器的afterCompletion()方法，再退出拦截器链 -
	 * 如果返回true 执行下一个拦截器，知道素有的拦截器都执行完毕 再执行被拦截的Controller 然后进入拦截器链，
	 * 从最后一个拦截器往回执行所有的postHandel()方法 接着再从最后一个拦截器往回执行所有的afterCompletion()方法
	 *
	 * @param request
	 * @param response
	 * @param handler
	 * @return
	 * @throws Exception
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		// 只要是下面的地址，就不拦截，不是下面的地址都拦截 /wmyskxz/bought
		String[] noNeedAuthPage = new String[] { "/wmyskxz/home", "/wmyskxz/searchProduct", "/wmyskxz/sortProduct",
				"/wmyskxz/showProduct", "/wmyskxz/loginPage", "/wmyskxz/login", "/wmyskxz/registerPage",
				"/wmyskxz/register", "/wmyskxz/registerSuccessPage", "/wmyskxz/test", "/wmyskxz/checkLogin",
				"/wmyskxz/admin" };
		String uri = request.getRequestURI();// 获取当前的链接地址
		System.out.println("uri=" + uri);
		if (!Arrays.asList(noNeedAuthPage).contains(uri)) {// 当前的链接地址是否在我们的集合里面
			User user = (User) session.getAttribute("user");// 获取user属性，咋们项目里面user是用session存的
			if (null == user) {
				System.out.println("执行了拦截器if");
				request.getRequestDispatcher("/WEB-INF/views/loginPage.jsp").forward(request, response);
				return false;
			}
		}
		return true;
	}

	/**
	 * 在业务处理器处理请求执行完成后，生成视图之前执行的动作 可在 modelAndView 中加入数据，比如当前的时间
	 *
	 * @param request
	 * @param response
	 * @param handler
	 * @param modelAndView
	 * @throws Exception
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	/**
	 * 在DispatcherServlet完全处理完请求后被调用，可用于清理资源等
	 * 当有拦截器抛出异常时，会从当前拦截器往回执行所有的拦截器的afterCompletion()方法
	 *
	 * @param request
	 * @param response
	 * @param handler
	 * @param ex
	 * @throws Exception
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
}
