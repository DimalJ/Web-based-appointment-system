
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
 <link rel="icon" href="./Images/favicon.ico" type="image/x-icon">
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="./css/styles.css">
</head>
<body>
<!-- Navigation Bar -->
   <nav class="navbar navbar-expand-md navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Lion Consultants</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
        <div class="navbar-text ml-auto">
            Welcome, ${sessionScope.username} (${sessionScope.userType})
        </div>
        <div class="navbar-text ml-auto">
           <a class="nav-link" href="LogoutServlet">Logout</a>
        </div>
    </nav>
<h1>Admin</h1>
<a href="adminAddUser.jsp"><button type="submit" id="addUser" name="addUser">Add User</button></a>


 <div class="container">
        <h2>View Users</h2>
         <form action="<%= request.getServletContext().getContextPath()%>/AdminViewUserServlet" method="post">
          <div class="form-row">
	           
                <div class="form-group col-md-6">
                    <label for="type">User Type</label>
                    <select class="form-control" id="type" name="type" required>
                        <option value="" selected disabled>Select User Type</option>
                        <option value="jobSeeker">Job Seeker</option>
                        <option value="consultant">Consultant</option>
                        <option value="admin">Admin</option>
                    </select>
               </div>
               
          </div>  
          <button type="submit" class="btn btn-dark btn-lg">Search</button>
         </form>
        

       <table class="table table-bordered">
            <thead>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Contact</th>
                </tr>
            </thead>
            <tbody>
                <script>console.log("aaaaaaaaaaa" ${users});</script>
                
                <c:forEach items="${users}" var="user">
                <script>console.log("aaaaaaaaaaa" );</script>
                <tr>
                        <td>${user.fName}</td>
                        <td>${user.lName}</td>
                        <td>${user.username}</td>
                        <td>${user.email}</td>
                        <td>${user.contact}</td>
                         <td>
                    	<a href="edit?username=<c:out value='${user.username}' />">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete?username=<c:out value='${user.username}' />">Delete</a>                    	
                    </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>	
</body>
</html>