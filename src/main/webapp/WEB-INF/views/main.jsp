<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <p>Hello ${user.name}!</p>
    <p>Your password is ${user.password}</p>
    <p>Admin ${user.admin}</p>
    <p>Locale ${locale} </p>

    <form:form method="POST" action="/upload-file" enctype="multipart/form-data" modelAttribute="uploadedFile">
        <table>
            <tr>
                <td>Upload File:</td>
                <td><input type="file" name="file"></td>
                <td style="color:red; font-style: italic;">
                    <form:errors path="file"/>
                </td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="Upload"></td>
                <td></td>
            </tr>
        </table>
    </form:form>
</body>
</html>
