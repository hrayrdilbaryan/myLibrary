<%@ page import="java.util.List" %>
<%@ page import="model.Author" %>
<%@ page import="model.Book" %><%--
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
    Book book = (Book) request.getAttribute("book");

    List<Author> authors = (List<Author>) request.getAttribute("authors");

%>
<f1>Please update authors data:</f1>
<form action="/authors/edit" method="post">
    <input type="hidden" name="bookid" value="<%=book.getId()%>">
    <input type="text" name="title" value="<%=book.getTitle()%>"/> <br>
    <input type="text" name="description" value="<%=book.getDescription()%>"/> <br>
    <input type="number" name="price" value="<%=book.getPrice()%>"/> <br>
    <select name="authorId">
        <%
            for (Author author : authors) {
                if (author.equals(book.getAuthor())) {
        %>
        <option selected value="<%=author.getId()%>"><%=author.getName()%>
        </option>
        <% } else { %>
        <option value="<%=author.getId()%>"><%=author.getName()%>

                <%  }
            } %>
    </select>

    <input type="submit" value="Add">


</form>
</body>
</html>
