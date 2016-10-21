<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<meta charset="UTF-8">
<title>图书信息</title>

<style>
.content {
	margin-top: 60px;
}

.content button {
	height: 30px;
	color: white;
	font-size: 18px;
	border: 0px;
	padding: 0px;
	cursor: pointer;
}
/*信息面板*/
.content .panel {
	background-color: rgba(255, 255, 255, .9);
	width: 600px;
	text-align: center;
	margin: 0px auto;
	padding-top: 20px;
	padding-bottom: 20px;
	border: 0px;
	border-radius: 5px;
}
/*输入组*/
.content .panel .group {
	text-align: left;
	width: 500px;
	margin: 0px auto 20px;
}

.content .panel .group label {
	line-height: 30px;
	font-size: 18px;
}

.content .panel .group output {
	float: right;
	margin-right: 45px;
	width: 345px;
	height: 30px;
	border: 1px solid #ddd;
	padding: 0px 0px 0px 10px;
	font-size: 21px;
	text-align: center;
	background-color: #FFFFFF;
}

.content .panel .submit button {
	background-color: #CC865E;
	width: 100px;
}

.content .panel .submit button:hover {
	background-color: white; /*按钮选中后背景颜色为白色*/
	color: #CC865E; /*按钮选中后字体颜色为褐色*/
	border: 1px solid #CC865E; /*按钮选中后边框颜色为褐色*/
}
</style>

</head>

<body>
	<div id="Layer1"
		style="position:absolute;left:0;top:0;width:100%; height:100%; z-index:-1">
		<img src="source/bookshelf.jpg" height="100%" width="100%" />
	</div>

	<div class="content">
		<div class="panel">
			<h1><s:property value="#request.title"/></h1>
			<s:form name="delete" action="delete" method="post" namespace="/book">
			<s:div class="group">
				<label>图书名</label>
				<output><s:property value="#request.title"/></output>
			</s:div>
			<s:div class="group">
				<label>作者</label>
				<output>author name</output>
			</s:div>
			<s:div class="group">
				<label>年龄</label>
				<output>age</output>
			</s:div>
			<s:div class="group">
				<label>国籍</label>
				<output>country</output>
			</s:div>
			<s:div class="group">
				<label>ISBN(PK)</label>
				<output><s:property value="#request.ISBN"/></output>
			</s:div>
			<s:div class="group">
				<label>作者ID(FK)</label>
				<output><s:property value="#request.authorID"/></output>
			</s:div>
			<s:div class="group">
				<label>出版社</label>
				<output><s:property value="#request.publisher"/></output>
			</s:div>
			<s:div class="group">
				<label>出版日期</label>
				<output><s:property value="#request.publishDate"/></output>
			</s:div>
			<s:div class="group">
				<label>价格</label>
				<output><s:property value="#request.price"/></output>
			</s:div>
			<!-- 添加按钮 -->
			<div class="submit">
				<a href="<%=path %>/book/delete.action?ISBN=<s:property value="#request.ISBN"/>">
				删除</a>
			</div>
			</s:form>
		</div>
	</div>
</body>
</html>
