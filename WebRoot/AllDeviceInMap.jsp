<%@page import="com.sun.org.apache.bcel.internal.generic.LNEG"%>
<%@page import="java.util.List"%>
<%@page import="cn.edu.shu.entity.Device"%>
<%@page import="cn.edu.shu.service.impl.DeviceServiceImpl"%>
<%@page import="cn.edu.shu.service.IDeviceService"%>
<%@page import="cn.edu.shu.service.ICurrentDataService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
html,body{
	height: 100%;
}
	#allmap {width: 100%;height: 90%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ARry4V5u1FDH8MkHAN32QRDdCNL4S7Hd"></script>
<title>查看所有充电桩信息</title>
</head>
<body>
<jsp:include page="./top.jsp" flush="true"/>

<div style="text-align: center;width: 100%;height: 5%">
 <input type="text" id="keyword" />&nbsp;&nbsp;
    <input type="button" onclick="search();" value="搜索地图" />&nbsp;&nbsp;
	<button onclick="window.history.back()">返回</button>
</div>
<%
	//获取所有的充电桩
	IDeviceService deviceService =new  DeviceServiceImpl();
	List<Device> list = deviceService.getDeviceAll();

%>
<div id="allmap"></div>

</body>
</html>
<script type="text/javascript">
//编写自定义函数,创建标注
function addMarker(point,code,name,address,person,des){
  var marker = new BMap.Marker(point);
   map.addOverlay(marker); 
  var opts = {
		  width : 300,     // 信息窗口宽度
		  height: 150,     // 信息窗口高度
		  title :  "<strong style=\"font-size:16px;font-weight:bold\">充电桩信息</strong>" , // 信息窗口标题
		  enableMessage:true,//设置允许信息窗发送短息
		  message:""
		}
  var info = "编号：'"+code+"'<br/>"+"名称：'"+name+"'<br>"+"地址：'"+address+"'<br>"+"负责人：'"+person+"'";
		var infoWindow = new BMap.InfoWindow(info, opts);  // 创建信息窗口对象 
	marker.addEventListener("click", function(){          
	map.openInfoWindow(infoWindow,point); //开启信息窗口
}); 
}
function search(){
    var keyword = document.getElementById("keyword").value;
    var local = new BMap.LocalSearch(map, {
    renderOptions:{map: map}
});
local.search(keyword);
}

	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	
	map.centerAndZoom("上海", 15);  // 初始化地图,设置中心点坐标和地图级别
	  
	map.setCurrentCity("上海");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom(true);     //开启鼠标滚轮缩放
	//地图平移缩放控件
	  var ctrlNav = new window.BMap.NavigationControl({
          anchor: BMAP_ANCHOR_TOP_LEFT,
          type: BMAP_NAVIGATION_CONTROL_LARGE
      });
      map.addControl(ctrlNav);

      //向地图中添加缩略图控件
      var ctrlOve = new window.BMap.OverviewMapControl({
          anchor: BMAP_ANCHOR_BOTTOM_RIGHT,
          isOpen: 1
      });
      map.addControl(ctrlOve);

      //向地图中添加比例尺控件
      var ctrlSca = new window.BMap.ScaleControl({
          anchor: BMAP_ANCHOR_BOTTOM_LEFT
      });
      map.addControl(ctrlSca);
	<%
		for(Device d:list){

	%>
	var point = new BMap.Point(<%=d.getLng()%>,<%=d.getLat()%>);
	addMarker(point,'<%=d.getCode()%>','<%=d.getName()%>','<%=d.getAddress()%>','<%=d.getPerson()%>');
	 
	<%}%>
</script>