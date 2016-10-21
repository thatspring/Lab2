<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">


<meta charset="UTF-8">
<title>作者图书信息</title>

<style type="text/css">
.content {
	margin-top: 50px;
}

.content .panel {
	background-color: rgb(255, 255, 255); /*登录面板背景颜色为白色*/
	width: 1460px;
	height: 600px;
	margin-left: 50px;
	padding-top: 20px; /*顶部的内边距为20px*/
	padding-bottom: 20px; /*底部的内边距为20px*/
	border: 0px;
}

.content .panel h1 {
	margin-left: 50px;
}

.content .panel .group {
	float: left;
	text-align: left;
	width: 250px; /*宽度为262px*/
	margin-left: 20px;
	border: 2px solid #ddd;
}

.content .panel .table {
	float: right;
	width: 1156px;
	height: 200px;
	border: 2px solid #ddd;
	margin-right: 20px;
}
</style>

</head>

<body>
	<!-- 背景 -->
	<div id="Layer1"
		style="position:absolute;left:0;top:0;width:100%; height:100%; z-index:-1">
		<img src="source/bookshelf.jpg" height="100%" width="100%">
	</div>

	<!-- 信息面板 -->
	<div class="content">
		<div class="panel">
			<h1><s:property value="#request.name"/></h1>
			<div class="group">
				<p>作者简介：</p>
				<p>ID:<s:property value="#request.authorID"/></p>
				<p>AGE:<s:property value="#request.age"/></p>
				<p>COUNTRY:<s:property value="#request.country"/></p>
			</div>
			
			<div class="table">
				<h2>BOOK LIST</h2>
				<table>
						<s:iterator value="#request.booklist" var="title">
						<tr class="list">
							<td>
							<a href="<%=path %>/book/bookinfo.action?title=<s:property value="#title"/>"><s:property value="#title"/>
							</a>
							</td>	
						</tr>
   						</s:iterator>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
