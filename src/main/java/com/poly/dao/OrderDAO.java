package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Order;
import com.poly.entity.Product;

public interface OrderDAO extends JpaRepository<Order, Long> {
	@Query("SELECT o FROM Order o WHERE o.account.username=?1")
	List<Order> findByUsername(String username);

	@Query(value = "select year(create_date)" + " from orders" + " group by year(create_date)", nativeQuery = true)
	List<Integer> findByYear();

	@Query(value = "select MONTH(o.create_date) as month, SUM(o.tongtien) as totalRevenue" + " from orders o"
			+ " where YEAR(o.create_date) = ?1" + " group by MONTH(o.create_date)", nativeQuery = true)
	List<Object[]> findByDoanhThuNam(int year);

	@Query("SELECT o FROM Order o ORDER BY o.createDate DESC")
	List<Order> findAllOrderByCreateDateDesc();

	List<Order> findByAccountUsername(String username);

	//// Tổng doannh thu hôm nay
	@Query("SELECT SUM(o.tongtien) FROM Order o WHERE CONVERT(date, o.createDate) = CONVERT(date, CURRENT_TIMESTAMP)")
	Double getTotalRevenueToday();

	//AOV
	@Query(value = "SELECT ROUND( CASE " + "    WHEN COUNT(*) > 0 THEN SUM(tongtien) / COUNT(*) " + "    ELSE 0 "
			+ "END, 2)" + "FROM Orders o " + "WHERE o.create_date >= DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()), 0) "
			+ "    AND o.create_date < DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) + 1, 0)", nativeQuery = true)
	Double AverageOrderValue();

	// Tổng doannh thu năm nay
	@Query(value = "SELECT ROUND( SUM(tongtien), 2) FROM Orders WHERE YEAR(create_date) = YEAR(GETDATE())", nativeQuery = true)
	Double getTotalRevenueThisYear();
}
