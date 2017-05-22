<%@ page import="model.Power" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%
    boolean error = false;
    Power power = null;
    if(session.getAttribute("power")==null){
        error=true;
    } else {
        power = (Power)session.getAttribute("power");
    }
    pageContext.setAttribute("red",error);
    pageContext.setAttribute("power", power);
%>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/pure-min.css"
          integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/customcss.css">
    <meta charset="UTF-8">
    <title>POW</title>
    <c:if test="${red}">
        <meta http-equiv="Refresh" content="5;url=index.jsp">
    </c:if>
</head>
<body>
<div style="margin-top: 10%" class="pure-g">
    <div class="pure-u-1-3"></div>
    <div class="pure-u-1-3">
        <h1>Вычисление показательной функции</h1>
        <h2>Результат вычисления функции:</h2>

        <c:choose>
            <c:when test="${power!=null}">
                <h2> <%= power.getBase() %>  <sup><small><%= power.getExp()%></small></sup>  = <%= power.getResult()%> </h2>
            </c:when>
            <c:when test="${power==null}">
                <h2 class="error">Не получен. Вы будете переадресованны
                    на предыдущую страницу через 5 секунд</h2>
            </c:when>
        </c:choose>
        <c:if test="${power!=null}">
        <div>
            <a class="pure-button button-secondary" href="index.jsp">Back to previous page</a>
            <a class="pure-button button-secondary" href="${pageContext.request.contextPath}/second_task/getXml.xml">
                Download result</a>
        </div>
        </c:if>
    </div>
    <div class="pure-u-1-3"></div>
</div>
</body>
</html>
