<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>농민 지원 Support System</title>
<style>
	#forWorkers{
		display:none;
	}
</style>
<script>
	window.onload = function() {
		const famer = document.getElementById("famer");
		const worker = document.getElementById("worker");
		const forWorkers = document.getElementById("forWorkers");
		console.log(worker);
		famer.onclick = function(){
			forWorkers.style.display = "none";
		};
		worker.onclick = function(){
			forWorkers.style.display = "block";
		};
	};
</script>

</head>
<body> 
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
				<li><a href="bbs.jsp">역경매</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>	
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbtron" style="padding-top:20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">
					</div>
					
					<div class="form-group" style="text-align:center">
						<div class="btn-group" data-toggle="buttons" id="typeRadio">
							<label id="famer" class="btn btn-primary">
								<input type="radio" name="userType" autocomplete="off" value="famer" checked>농부
							</label>
							<label id="worker" class="btn btn-primary">
								<input type="radio" name="userType" autocomplete="off" value="worker" checked>작업자
							</label>
						</div>	
					</div>
					<div id="forWorkers">
						<div class="form-group" style="text-align:center">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" name="userMachine" autocomplete="off" value="tractor" checked>트랙터
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="userMachine" autocomplete="off" value="cultivator" checked>경운기
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="userMachine" autocomplete="off" value="thresher" checked>탈곡기
								</label>
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="농기계폭" name="machineWidth" maxlength="20">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="지역" name="userRegion" maxlength="20">
						</div>
					</div>
					
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js">
	</script>
	<script src="js/bootstrap.js"></script>
</body>
</html>