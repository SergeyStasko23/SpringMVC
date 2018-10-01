<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="<c:url value="/resources/css/home.css"/>" rel="stylesheet">
    <title>Document</title>

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">
        function doAjax() {
            $.ajax({
                url: 'check-strength',
                data: ({password : $('#password').val()}),
                success: function (data) {
                    $('#strengthValue').html(data);
                }
            });
        }
    </script>
</head>
<body>
    <form:form method="post" modelAttribute="user" action="check-user" class="boxLogin">
        <fieldset class="boxBody">
            <span style="float: right; color: blue">
                <a href="?lang=en">en</a>
                <a href="?lang=ru">ru</a>
            </span>

            <form:label path="name"><spring:message code="username"/></form:label>
            <form:input path="name"/>
            <form:errors path="name" cssClass="error"/>

            <form:label path="password"><spring:message code="password"/></form:label>
            <form:password path="password" onkeyup="doAjax()"/>
            <form:errors path="password" cssClass="error"/>
            <span style="float: right" id="strengthValue"></span>
        </fieldset>

        <footer>
            <form:checkbox path="admin"/>
            <form:label path="admin"><spring:message code="admin"/></form:label>

            <input type="submit" class="btnLogin" value="<spring:message code="login"/>" tabindex="4">
        </footer>
    </form:form>
</body>
</html>
