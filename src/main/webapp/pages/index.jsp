<%--
  Created by IntelliJ IDEA.
  User: My
  Date: 2019/11/18
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>

<script>

    // 删除
    function plDelete(){

        var str = document.getElementsByName("one");
        for(var i=0;i<str.length;i++){
            if(str[i].checked==true){

                if(confirm("是否删除选中的车次？")){
                    var formData = $("#pageForm").serialize();
                    $.ajax({
                        type:"post",
                        url:"${pageContext.request.contextPath }/detail/detele",
                        data:formData,
                        success: function(msg){
                            if(msg=="chenggong"){
                                alert("删除成功");
                                window.location.reload();
                            }else{
                                alert("删除失败");
                            }
                        }
                    });
                }
                return ;
            }
        }
        alert("请选择要删除的车次！");

    }

</script>


<center>
<form id="pageForm">
    <table border="1" style="line-height:60px;width:600px;">
        <tr>
            <td><a href="javascript:void(0)" onclick="plDelete()" >删除</a></td>
            <td>车次</td>
            <td>发车--到达</td>
            <td>发时--到时</td>
            <td>车型</td>
            <td>运行时间（小时）</td>
        </tr>
        <c:forEach items="${requestScope.detailList}" var="detail" >
            <tr>
                <td><input type="checkbox" name="one" value="${detail.detailId}" /></td>
                <td><a href="${pageContext.request.contextPath}/detail/toInfo?detailId=${detail.detailId}">${detail.number}</a></td>
                <td>${detail.beginStation}--${detail.endStation}</td>
                <td>${detail.beginTime}--${detail.endTime}</td>
                <td>${detail.type}</td>
                <td>${detail.runTime}</td>
            </tr>
        </c:forEach>
    </table>
</form>
</center>
</body>
</html>
