<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>

<script>

    $(document).ready(function(){
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath }/detail/one",
            success:function(){
                window.location.href="${pageContext.request.contextPath }/detail/toIndex";
            }
        })
    })

</script>
<h2>Hello World!</h2>
</body>
</html>
