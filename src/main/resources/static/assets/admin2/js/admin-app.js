const app = angular.module("app1", ["ngRoute"]);

app.config(function($routeProvider) {
	$routeProvider
		.when("/dashboard", {
			templateUrl: "/assets/admin2/pages/dashboard/index.html",
			controller: "dashboard-ctrl"
		})
		.when("/table", {
			templateUrl: "/assets/admin2/pages/tables.html",
		})
		.when("/billing", {

			templateUrl: "/assets/admin2/pages/billing.html",			
		})
		.when("/product", {
			templateUrl: "/assets/admin2/pages/product/index.html",
			controller: "product-ctrl"
		}).when("/history", {
			templateUrl: "/assets/admin2/pages/history.html",
			controller: "history-ctrl"
		}).when("/discount", {
			templateUrl: "/assets/admin2/pages/discountCode/index.html",
			controller: "discount-ctrl"
		}).when("/discountProduct", {
			templateUrl: "/assets/admin2/pages/discountProduct/index.html",
			controller: "discountProduct-ctrl"
		}).when("/size", {
			templateUrl: "/assets/admin2/pages/size/index.html",
			controller: "size-ctrl"
		}).when("/authority", {
			templateUrl: "/assets/admin2/pages/authority/index.html",
			controller: "authority-ctrl"
			}).when("/account", {
			templateUrl: "/assets/admin2/pages/account.html",
			controller: "account-ctrl"
		}).when("/profile", {
			templateUrl: "/assets/admin2/pages/profile.html",		
		})
		
		.otherwise({
			redirectTo: "/dashboard"
		});
});