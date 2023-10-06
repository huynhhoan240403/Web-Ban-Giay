package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Order;
import com.poly.entity.OrderDetail;



public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {
	
	@Query("SELECT o FROM OrderDetail o WHERE o.order.id=?1")
	List<OrderDetail> findByOrderDetailId(Long id);
}
