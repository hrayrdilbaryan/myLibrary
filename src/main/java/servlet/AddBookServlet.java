package servlet;

import manager.AuthorManager;
import manager.BookManager;
import model.Author;
import model.Book;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/books/add")
public class AddBookServlet extends HttpServlet {

    private AuthorManager authorManager = new AuthorManager();
    private BookManager bookManager = new BookManager();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Author> all = authorManager.getAll();
        request.setAttribute("authors", all);
        request.getRequestDispatcher("/WEB-INF/addBook.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
        int authorId =Integer.parseInt(request.getParameter("authorId")) ;
        Book book = Book.builder()
                .title(title)
                .description(description)
                .price(price)
                .author(authorManager.getById(authorId))
                .build();

        bookManager.add(book);
        response.sendRedirect("/books");
    }
}
