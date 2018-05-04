<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'TestMarker.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=ARry4V5u1FDH8MkHAN32QRDdCNL4S7Hd"></script>
<style type="text/css">
#container {width: 100%;height: 90%;overflow: hidden;margin:0;font-family:"微软雅黑";}
</style>
  </head>
  
  <body>
   <script language="javascript">
   var map = new BMap.Map("container");
   var point = new BMap.Point(116.404, 39.915);
   map.centerAndZoom(point, 15);
   // 编写自定义函数，创建标注
   function addMarker(point, index){
   // 创建图标对象
   var myIcon = new BMap.Icon(" http://api.map.baidu.com/images/marker_red_sprite.png ", new BMap.Size(23, 25), {
   offset: new BMap.Size(10, 25),
   // 设置图片偏移。
   // 当您需要从一幅较大的图片中截取某部分作为标注图标时，您
   // 需要指定大图的偏移位置，此做法与css sprites技术类似。
   imageOffset: new BMap.Size(0, 0 - index * 25) // 设置图片偏移
   });
   // 创建标注对象并添加到地图
   var marker = new BMap.Marker(point, {icon: myIcon});
   map.addOverlay(marker);
   }
   // 随机向地图添加10个标注
   var bounds = map.getBounds();
   var lngSpan = bounds.maxX - bounds.minX;
   var latSpan = bounds.maxY - bounds.minY;
   for (var i = 0; i < 10; i ++) {
   var point = new BMap.Point(bounds.minX + lngSpan * (Math.random() * 0.7 + 0.15),
   bounds.minY + latSpan * (Math.random() * 0.7 + 0.15));
   addMarker(point, i);
   }
   </script>
  </body>
</html>
