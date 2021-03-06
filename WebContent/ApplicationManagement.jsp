<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/jquery-1.7.2.js"></script>
<script type="text/javascript">
	$(function(){
		$(".div4").hide();
		//$(".div3").hide();
		$(".button").click(function(){
			$(".div4").toggle();
		});
		$(".view").click(function(){
			$(".div3").toggle();
		});
	})
</script>
<body>
<c:if test="${!empty requestScope.list}">
	<div class="div1">
		<table border="1">
			<tr>
				<td>序号</td>
				<td>应聘者</td>
				<td>投递时间</td>
				<td>查看状态</td>
				<td>面试状态</td>
				<td colspan="2">操作</td>
			</tr>
			<c:forEach items="${requestScope.list}" var="list">
				<tr>
					<td>${list.id }</td>
					<td>${list.uId }</td>
					<td>
							<f:formatDate value="${list.date }" pattern="yyyy-MM-dd"/>
						</td>
					<td>${list.status }</td>
					<td>${list.interviewStatus }</td>
					<td><a href="${pageContext.request.contextPath}/view?userId=${list.uId }" class="view">查看</a></td>
					<td><a href="${pageContext.request.contextPath}/delete?id=${list.id }">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</c:if>	

<c:if test="${empty requestScope.list}">
还没有人应聘！！
</c:if>	
	<div class="div3">
		<table border="1">
				<tr>
					<td colspan="4" align="center">简历</td>
				</tr>
				<tr>
					<td>真实姓名</td>
					<td><input type="text" style="color: gray" value="${requestScope.resume.name}"
						name="name" /></td>
					<td>性别</td>
					<td>男<input type="radio" value="男" name="gender" 
						<c:if test="${requestScope.resume.gender=='男'}">checked="checked"</c:if>
					/>
					女<input type="radio" name="gender" value="女" 
						<c:if test="${requestScope.resume.gender=='女'}">checked="checked"</c:if>
					/>
					</td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" style="color: gray" value="${requestScope.resume.age}"
						name="age" /></td>
					<td>学历</td>
					<td><select name="diploma">
							<option value="高中及以下" <c:if test="${requestScope.resume.diploma=='高中及以下'}">selected="selected"</c:if>>高中及以下</option>
							<option value="大学" <c:if test="${requestScope.resume.diploma=='大学'}">selected="selected"</c:if>>大学</option>
							<option value="研究生" <c:if test="${requestScope.resume.diploma=='研究生'}">selected="selected"</c:if>>研究生</option>
							<option value="博士及以上" <c:if test="${requestScope.resume.diploma=='博士及以上'}">selected="selected"</c:if>>博士及以上</option>
					</select></td>
				</tr>
				<tr>
					<td>联系方式</td>
					<td><input type="text" style="color: gray" value="${requestScope.resume.tel}"
						name="tel" /></td>
					<td>e-mail</td>
					<td><input type="text" style="color: gray" value="${requestScope.resume.email}"
						name="email" /></td>
				</tr>
				<tr>
					<td>应聘职位</td>
					<td><select name="department" class="department">
					<c:if test="${!empty requestScope.departments}">
						<c:forEach items="${requestScope.departments}" var="department">
							<option value="${department.name}">${department.name}</option>
						</c:forEach>
					</c:if>
					</select> <select name="position">
					<%-- <c:if test="${!empty requestScope.positions}">
						<c:forEach items="${positions}" var="position" >
							<c:forEach items="${position.departments}" var="department">
								<c:if test="${position.depName==department.name}">
									<option value="${position.name}">${position.name}</option>
								</c:if>
							</c:forEach>
						</c:forEach>
					</c:if> --%>
					</select></td>
					<td>政治面貌</td>
					<td><select name="politicalStatus">
							<option value="普通群众" <c:if test="${requestScope.resume.politicalStatus=='普通群众'}">selected="selected"</c:if>>普通群众</option>
							<option value="团员" <c:if test="${requestScope.resume.politicalStatus=='团员'}">selected="selected"</c:if>>团员</option>
							<option value="党员" <c:if test="${requestScope.resume.politicalStatus=='党员'}">selected="selected"</c:if>>党员</option>
							<option value="其他" <c:if test="${requestScope.resume.politicalStatus=='其他'}">selected="selected"</c:if>>其他</option>
					</select></td>
				</tr>
				<tr>
					<td>上份工作</td>
					<td><input type="text" style="color: gray" value="${requestScope.resume.lastJob}"
						name="lastJob" /></td>
					<td>工作经验</td>
					<td><input type="text" style="color: gray" value="${requestScope.resume.workingExperience}"
						name="workingExperience" /></td>
				</tr>
				<tr>
					<td>期望薪资</td>
					<td><select name="expectedSalary">
							<option value="3000-4000" <c:if test="${requestScope.resume.expectedSalary=='3000-4000'}">selected="selected"</c:if>>3000-4000</option>
							<option value="4000-5000" <c:if test="${requestScope.resume.expectedSalary=='4000-5000'}">selected="selected"</c:if>>4000-5000</option>
							<option value="5000-6000" <c:if test="${requestScope.resume.expectedSalary=='5000-6000'}">selected="selected"</c:if>>5000-6000</option>
							<option value="6000-7000" <c:if test="${requestScope.resume.expectedSalary=='6000-7000'}">selected="selected"</c:if>>6000-7000</option>
					</select></td>
					<td>兴趣爱好</td>
					<td><input type="text" style="color: gray" value="${requestScope.resume.hobbies}"
						name="hobbies" /> <input type="hidden" name="userId"
						value="${requestScope.resume.userId}" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="面试" class="button"/></td>
					<td colspan="2"><input type="button" value="返回" /></td>
				</tr>
			</table>
	</div>
	<div class="div4">
		<form action="${pageContext.request.contextPath}/interviewTime">
			<input type="hidden" name="uId" value="${requestScope.resume.userId}" />
			日期：<input type="text" name="interviewTime"/>
			<input type="submit" value="确认"/>
		</form>
	</div>
</body>
</html>