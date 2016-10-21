<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="UTF-8">
	<title>图书管理系统</title>
	<link type="text/css" rel="stylesheet" href="search.css"/>

<style>
ul
{
list-style-type:none;
margin:0;
padding:0;
overflow:hidden;
}
li
{
float:left;
}
a:link,a:visited
{
display:block;
width:120px;
font-weight:bold;
color:#8B0000;
background-color:rgba(255,255,255,.8);
background-opacity:0.3;
text-align:center;
padding:5px;
text-decoration:none;
text-transform:uppercase;
}
a:hover,a:active
{
background-color:#FFFFFF;
}
</style>

  </head>
  
  <body>
    <div id="Layer1" style="position:absolute;left:0;top:0;width:100%; height:100%; z-index:-1">    
		<img src="source/bookshelf.jpg" height="100%" width="100%">    
	</div>

<!-- 背景板 -->
	<div class="content" style="position:absolute;left:0;top:0;width:100%; height:100%; z-index:-1">	
	</div>

<!-- 导航栏 -->
	<div id="menu">
		<ul>
			<li style="padding:1px" class="first"><a href="#manage">管理图书</a></li>
			<li style="padding:1px"><a href="#user">个人中心</a></li>
			<li style="padding:1px"><a href="#help">帮助</a></li>
			<li style="padding:1px"><a href="#connect">联系我们</a></li>
		</ul>
	</div>

<!-- 搜索面板 -->
	<div id="search_box">
		<s:form name="search" action="search" method="post" namespace="/book"> 
			<input name="authorname" type="text" id="s" placeholder=" 请输入作者名"/> 
			<input type="image" src="source/searchicon.jpg" width="40" height="40" id="go" alt="Search" title="Search" /> 
		</s:form>
	</div>

  </body>
</html>
