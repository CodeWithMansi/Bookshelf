<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.bookshelf.dtos.BookDto" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookshelf | Dashboard</title>
    <link rel="stylesheet" href="css/dashboard.css">

</head>
<body class="background">

    <!-- Navbar -->
    <header class="navbar">
        <h1 class="navbar-title">Bookshelf</h1>

         <!-- Embedded Nav_bar -->
        <%@include file="admin_navBar.jsp" %>

    </header>

		<c:if test="${not empty userInfo}">
		    <h2 style="text-align: center;">Edit User</h2>
		
		    <div class="user-card-container">
		        <div class="user-card">
		            <form action="editUser" method="post">
		                <h3>User Information</h3>
		                <p>
		                    <label for="user_id"><strong>User ID</strong></label>
		                    <input id="user_id" type="text" name="user_id" value="${userInfo.user.user_id}" readonly>
		                </p>
		                <p>
		                    <label for="username"><strong>Username</strong></label>
		                    <input id="username" type="text" name="username" value="${userInfo.user.username}" readonly>
		                </p>
		                <p>
		                    <label for="first_name"><strong>First Name</strong></label>
		                    <input id="first_name" type="text" name="first_name" value="${userInfo.user.first_name}" readonly>
		                </p>
		                <p>
		                    <label for="last_name"><strong>Last Name</strong></label>
		                    <input id="last_name" type="text" name="last_name" value="${userInfo.user.last_name}" readonly>
		                </p>
		                <p>
		                    <label for="is_verified"><strong>Verified*</strong></label>
		                    <select id="is_verified" name="is_verified">
		                        <option value="true" ${userInfo.user.is_verified == true ? 'selected' : ''}>True</option>
		                        <option value="false" ${userInfo.user.is_verified == false ? 'selected' : ''}>False</option>
		                    </select>
		                </p>
		                <p>
		                    <label for="address"><strong>Address</strong></label>
		                    <input id="address" type="text" name="address" 
		                        value="${userInfo.address.address}, ${userInfo.address.city}, ${userInfo.address.province}, 
		                               ${userInfo.address.country}, ${userInfo.address.postal_code}" readonly>
		                </p>
		                <p>
		                    <label for="role_name"><strong>Role*</strong></label>
		                    <select id="role_name" name="role_name">
		                        <option value="sysAdmin" ${userInfo.userRole.role_name == 'sysAdmin' ? 'selected' : ''}>SysAdmin</option>
		                        <option value="librarian" ${userInfo.userRole.role_name == 'librarian' ? 'selected' : ''}>Librarian</option>
		                        <option value="member" ${userInfo.userRole.role_name == 'member' ? 'selected' : ''}>Member</option>
		                    </select>
		                </p>
		                <p>
		                    <label for="status"><strong>Status*</strong></label>
		                    <select id="status" name="status">
		                        <option value="Active" ${userInfo.userRole.status == 'Active' ? 'selected' : ''}>Active</option>
		                        <option value="Suspend" ${userInfo.userRole.status == 'Suspend' ? 'selected' : ''}>Suspend</option>
		                        <option value="Pending" ${userInfo.userRole.status == 'Pending' ? 'selected' : ''}>Pending</option>
		                    </select>
		                </p>
		                <p style="text-align: center;">
		                	<a href="UserManager" class="btn-back">Back</a>
		                    <button type="submit" class="btn-edit">Save Changes</button>
		                     
		                </p>
		            </form>
		        </div>
		    </div>
		</c:if>


             <!-- Footer -->
    <footer class="footer">
        <p>&copy; 2024 Bookshelf Application</p>
        <p>Created by the Bookshelf Development Team</p>
    </footer>

</body>
</html>