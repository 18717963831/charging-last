<%@page import="cn.edu.shu.entity.Device"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="cn.edu.shu.service.impl.DeviceServiceImpl"%>
<%@page import="cn.edu.shu.service.IDeviceService"%>
<%@page import="java.util.Calendar" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请指定一个查看的充电桩</title>
<%
	//查询所有的充电桩
	IDeviceService deviceService =new  DeviceServiceImpl();
	List<Device> list = deviceService.getDeviceAll();
   String startD=request.getParameter("startD");
   String endD=request.getParameter("endD");
   SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	if(startD==null||"".equals(startD)){
		Calendar now=Calendar.getInstance();
		now.add(Calendar.SECOND, -3600);
		 startD=formatter.format(now.getTime());
		session.setAttribute("startD", startD);
	}
	if(endD==null||"".equals(endD)){
		endD=formatter.format(new Date());
	}

%>
<script type="text/javascript">
function search(){
	var startDstring=document.getElementById("startD").toString();
	var endDstring=document.getElementById("endD").toString();
	 window.location.href='./UserList.jsp?startD='+startDstring+'endD='+endDstring;
}
</script>
</head>
<body>
<jsp:include page="./top.jsp" flush="true"/>
<form action="historyChart.jsp" method="post" >
<table  width="100%"  border="1"  cellspacing="0" cellpadding="0" >
 <tr valign="top">
 <td>
请指定一个充电桩：
 </td>
 <td>
 	<select name="deviceid">
 		<%
 			for(Device device:list){
 		%>
 			<option value="<%=device.getId()%>"><%=device.getName() %></option>
 		<%
 			}
 		%>
 	</select>
 </td>
 </tr>
 <tr>
 <td>请输入查询起始时间：</td>
 <td><input type="text" id="startD" name="startD" value="<%=startD%>"></td>
 <td>请输入查询结束时间:</td>
 <td><input type="text" id="endD" name="endD" value="<%=endD%>"></td>
 </tr>
 <tr>
 <td><input type="submit" value="确定" onclick="search()"></td>
 <td><input type="button" value="取消"></td>
 </tr>
</table>

</form>
</body>
</html>
