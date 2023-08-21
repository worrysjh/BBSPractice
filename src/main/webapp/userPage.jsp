<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>농민 지원 Support System</title>
<script>
	window.onload = () => {
		let userType = document.getElementsByName("userType");
		console.log(userType[0].value);
		let forWorkers = document.getElementById("forWorkers");
		console.log(forWorkers)
		if(userType[0].value == "worker"){
			forWorkers.style.display = "block";
		}
	};
</script>
<style>
	#forWorkers{
		display:none;
	}
</style>
</head>
<body> 
	<%	
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		UserDAO userDAO = new UserDAO();
	%>
	
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">농민 지원 Support System</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">역경매</a></li>
			</ul>
			
			<%
				if(userID == null){

			%>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>	
				</li>
			</ul>
			
			<%
			}
			else
			{
				
			%>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="userPage.jsp">내정보</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>	
				</li>
			</ul>
			
			<%
			}
			%>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbtron" style="padding-top:20px;">
					<h3 style="text-align: center">내정보</h3>
					<%
						User user = new User();
						user = userDAO.getUser(userID);
						System.out.println("kim" + user.getUserType());
					%>
					<div class="form-group">
						아이디
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" value="<%= user.getUserID() %>" readonly>
					</div>
					<div class="form-group">
						이름
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20" value="<%= user.getUserName() %>" readonly>
					</div>
					<div class="form-group">
						타입
						<input type="text" class="form-control" placeholder="타입" name="userType" maxlength="20" value="<%= user.getUserType() %>" readonly>
					</div>
					<div id="forWorkers">
						<div class="form-group">
							농기계
							<input type="text" class="form-control" placeholder="농기계" name="userMachine" maxlength="20" value="<%= user.getUserMachine() %>" readonly>
						</div>
						<div class="form-group">
							농기계폭
							<input type="text" class="form-control" placeholder="농기계폭" name="machineWidth" maxlength="20" value="<%= user.getMachineWidth() %>" readonly>
						</div>
						<div class="form-group">
							지역
							<input type="text" class="form-control" placeholder="지역" name="userRegion" maxlength="20" value="<%= user.getUserRegion() %>" readonly>
						</div>
					</div>
					<div class="form-group">
						이메일
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20" value="<%= user.getUserEmail() %>" readonly>
					</div>
					<% if( user.getUserType() == "famer" ){
					%>
					<div class="form-group">
						신뢰도
						<input type="text" class="form-control" placeholder="신뢰도" name="requestPoint" maxlength="20" value="<%= user.getRequestPoint() %>" readonly>
					</div>
					<%
					} else {%>
					<div class="form-group">
						신뢰도
						<input type="text" class="form-control" placeholder="신뢰도" name="resolvePoint" maxlength="20" value="<%= user.getResolvePoint() %>" readonly>
					</div>
					<%} %>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>

	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script>
	<script src="js/bootstrap.js"></script>
</body>
</html>