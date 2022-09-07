<%@ page import="java.util.List" %>
<%@ page import="model.Author" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 07.09.2022
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add author</title>
</head>
<body>

<%

    List<Author> authors = (List<Author>) request.getAttribute("authors");

%>
<f1>Please input authors data:</f1>
<form action="/authors/add" method="post">
    <input type="text" name="title" placeholder="please input title"/> <br>
    <input type="text" name="description" placeholder="please input description"/> <br>
    <input type="number" name="price" placeholder="please input price"/> <br>
    <select name="authorId">
        <%for (Author author : authors) {%>
        <option value="<%=author.getId()%>"><%=author.getName()%>  </option>
        <% } %>
    </select>

    <input type="submit" value="Add">


</form>
</body>
</html>
