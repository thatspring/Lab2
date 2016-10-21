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
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Book Managing System</title>
	<link type="text/css" rel="stylesheet" href="login.css"/>  
	
  </head>
<script>
var txt="";
function error()
{
try
  {
  adddlert("Welcome guest!");
  }
catch(err)
  {
  txt="用户名密码错误，请重新输入";
  alert(txt);
  }
}
</script>
  
  <body>

  
    <div id="Layer1" style="position:absolute;left:0;top:0;width:100%; height:100%; z-index:-1">    
		<img src="source/page.jpeg" height="100%" width="100%"/>    
	</div>
	
	<div class="content">
    	<!--  登录面板    -->
    	<div class="panel">
    		<s:form name="login" action="login" method="post" namespace="/usr">
        	<!--  账号和密码组    -->
        	<s:div class="group">
        		<label>用户名</label>
        		<input name="username" placeholder=" 请输入用户名"/>     
            	    
        	</s:div>
        	<s:div class="group">
        		<label>密码  </label>
            	<input name="password" placeholder=" 请输入密码" type="password"/>
        	</s:div>
       	 	<!--  登录按钮    -->
        	<div class="login">
            	<button type="submit">登录</button>
        	</div>
        	</s:form> 
    	</div>     
    	<!--  注册按钮    -->
    	<div class="register">
        	<button type="submit">创建新账号</button>
    	</div>
	</div>
	
  </body>
</html>
