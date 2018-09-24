<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="<c:url value="/resources/css/home.css"/>" rel="stylesheet">
    <title>Document</title>
</head>
<body>
    <form:form method="post" modelAttribute="user" action="check-user" class="boxLogin">
        <fieldset class="boxBody">
            <form:label path="name">Name</form:label>
            <form:input path="name"/>

            <form:label path="password">Password</form:label>
            <form:input path="password"/>
        </fieldset>

        <footer>
            <form:checkbox path="admin"/>
            <form:label path="admin">Admin</form:label>

            <input type="submit" class="btnLogin" value="login" tabindex="4">
        </footer>
    </form:form>
</body>
</html>
