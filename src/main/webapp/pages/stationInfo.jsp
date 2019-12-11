<%--
  Created by IntelliJ IDEA.
  User: My
  Date: 2019/11/18
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>车次详情</title>
</head>
<body>
<center>
<h3>火车车次详情</h3>
    <table border="1" style="line-height:40px;width:600px;">
        <tr>
            <td>车次编号</td>
            <td>${requestScope.detail.number}</td>
        </tr>
        <tr>
            <td>始发站</td>
            <td>${requestScope.detail.beginStation}</td>
        </tr>
        <tr>
            <td>终点站</td>
            <td>${requestScope.detail.endStation}</td>
        </tr>
        <tr>
            <td>发车时间</td>
            <td>${requestScope.detail.beginTime}</td>
        </tr>
        <tr>
            <td>到达时间</td>
            <td>${requestScope.detail.endTime}</td>
        </tr>
        <tr>
            <td>类型</td>
            <td>${requestScope.detail.type}</td>
        </tr>
        <tr>
            <td>里程</td>
            <td>${requestScope.detail.mileage}</td>
        </tr>
        <tr>
            <td>运行时间（小时）</td>
            <td>${requestScope.detail.runTime}</td>
        </tr>
    </table>

<div style="padding:10px;"></div>
<h3>途径站明细</h3>
    <table border="1" style="line-height:40px;width:600px;">
        <tr>
        <td>站点编号</td>
        <td>站点名称</td>
        <td>到达时间</td>
        <td>停车时间</td>
        <td>距下一站里程</td>
        <td>发车时间</td>
        </tr>
        <c:forEach items="${requestScope.detail.stationList}" var="s">
            <tr>
            <td>${s.number}</td>
            <td>${s.name}</td>
            <td>${s.arriveTime}</td>
            <td>${s.stopTime}</td>
            <td>${s.nextMileage}</td>
            <td>${s.startTime}</td>
        </tr>
        </c:forEach>
    </table>

</center>
</body>
</html>
