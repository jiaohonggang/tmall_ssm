package cn.wmyskxz.service;

import cn.wmyskxz.mapper.UserMapper;
import cn.wmyskxz.pojo.User;
import cn.wmyskxz.pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * UserService 实现类
 *
 * @author: @jim
 * @create: 2018-04-29-上午 9:47
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> list() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	@Override
	public void updatePassword(int id, String password) {
		User user = get(id);
		user.setPassword(password);
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public User get(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public User get(String name, String password) {
		//UserExample:定义user条件类
		UserExample example = new UserExample();
		//比较了两个参数
		example.or().andNameEqualTo(name).andPasswordEqualTo(password);
		
		
		List<User> result = userMapper.selectByExample(example);
		if (result.isEmpty())
			return null;
		return result.get(0);
		//select  *  from   user  where  name=? and  password=? //
	}

	@Override
	public boolean isExist(String name) {
		UserExample example =new UserExample();
		example.or().andNameEqualTo(name);
		List<User> result= userMapper.selectByExample(example);
		if(!result.isEmpty())
			return true;
		return false;
	}

	@Override
	public void add(User user) {
		userMapper.insert(user);
	}
}
