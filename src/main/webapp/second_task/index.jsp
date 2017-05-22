<%@ page import="model.Power" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%
    boolean expNotANumber = false;
    boolean baseNotANumber = false;
    boolean baseIsNegative = false;
    if(request.getParameter("exp") !=null && request.getParameter("base")!=null){
        baseNotANumber = !request.getParameter("base").matches("-?[0-9]+.?[0-9]+");
        expNotANumber = !request.getParameter("exp").matches("-?[0-9]+.?[0-9]+");
        baseIsNegative = request.getParameter("base").contains("-");
        if(!baseIsNegative){
            Power power = new Power(Double.parseDouble(request.getParameter("base")),
                    Double.parseDouble(request.getParameter("exp")));
            session.setAttribute("power",power);
            response.sendRedirect("result.html");
        }
    }
    pageContext.setAttribute("expCheck", expNotANumber);
    pageContext.setAttribute("baseNeg", baseIsNegative);
    pageContext.setAttribute("expCheck", baseNotANumber);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.2/build/pure-min.css"
          integrity="sha384-UQiGfs9ICog+LwheBSRCt1o5cbyKIHbwjWscjemyBMT9YCUMZffs6UqUTd0hObXD" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../css/customcss.css">
    <meta charset="UTF-8">
    <title>POW</title>
</head>
<body background="http://www.whitburnpevsner.com/wp-content/uploads/2014/10/Black-Gradient-for-windows.jpg">
<div style="margin-top: 10%" class="pure-g">
    <div class="pure-u-1-3"></div>
    <div class="pure-u-1-3">
        <h1>Вычисление показательной функции</h1>
        <form style="margin-left: 17%" class="pure-form pure-g pure-u-1" action="index.jsp" method="post">
            <div>
                <label style="margin-left: 31px">Base:</label>
                <c:choose>
                    <c:when test="${baseCheck || baseNeg}">
                        <c:if test="${baseNeg}">
                            <p class="error">Base must be positive</p>
                            <input class="error"
                        </c:if>
                        <c:if test="${baseCheck}">
                            <p class="error">Base must be a number</p>
                            <input class ="error"
                        </c:if>
                        </c:when>
                    <c:when test="${!baseCheck && !baseNeg}">
                        <input
                    </c:when>
                </c:choose>
                 id = "base", name="base" class="validate" title="Base" type="number"
                       placeholder="Введите основание" value="<%= request.getParameter("base")%>">
            </div>
            <p></p>
            <div>
                <label>Exponent:</label>
                <input id = "exp", name="exp" class="validate" type="number"
                       placeholder="Введите степень числа" value = "<%=request.getParameter("exp")%>">

            </div>
            <p></p>
            <div style="margin-left: 25%">
                <input class="pure-button pure-button-primary" type="submit" value="Submit">
            </div>
        </form>
    </div>
    <div class="pure-u-1-3"></div>
</div>
</body>
</html>