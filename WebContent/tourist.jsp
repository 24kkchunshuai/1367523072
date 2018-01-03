<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>游客界面</title>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$(".div1").hide();
		$(".change").click(function(){
			$(".div1").show();
		});
		$(".submit").click(function(){
			var old = $(".old").val();
			var new1 = $(".new1").val();
			var new2 = $(".new2").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/checkPassword",
				type:"post",
				dataType:"text",
				data:{password:old},
				success:function(data){
					alert(data);
					if(data==0){
						alert("原密码填写错误请重新输入");
					}else{
						if(new1.length==0||new1!=new2){
							alert("两次输入的新密码不同请检查");
						}else{
							$.ajax({
								url:"${pageContext.request.contextPath}/changePaaword",
								type:"post",
								dataType:"text",
								data:{password:new1},
								success:function(data){
									alert(data);
									if(data==1){
										alert("修改成功");
										$(".div1").hide();
									}else{
										alert("修改失败");
									}
								}
							});
						}
					}
				}
			});
		});
		
		$(".close").click(function(){
			var close = confirm("确认退出吗？");
			if(close==true){
				window.close();
			}
		});
		
	})
</script>
<body>
	<div>
		<b style="color: red">当前用户：${sessionScope.user.name}</b>
		<a href="#">反馈</a>
		<a href="#">查看简历</a>
		<a href="#" class="change">修改密码</a>
		<a href="#">其他</a>
		<a href="#" class="close">退出</a>
	</div>
	
	<div class="div1">
		<form action="${pageContext.request.contextPath}/modifyPassword">
			<table border="1">
			<caption>修改密码</caption>
				<tr>
					<td>原密码</td>
					<td><input type="text" class="old"/></td>
				</tr>
				<tr>
					<td>新密码</td>
					<td><input type="text" name="password" class="new1"/></td>
				</tr>
				<tr>
					<td>确认密码</td>
					<td><input type="text" class="new2"/></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="确认修改" style="color: red" class="submit"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>