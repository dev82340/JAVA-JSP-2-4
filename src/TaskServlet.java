import db.DBManager;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tasks;

import java.io.IOException;

@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String deadlineDate = request.getParameter("deadlineDate");

            Tasks newTask = new Tasks(1L, name, description, deadlineDate);
            DBManager.addTask(newTask);
        } else if ("delete".equals(action)) {
            Long id = Long.valueOf(request.getParameter("id"));
            DBManager.deleteTask(id);
        } else if ("details".equals(action)) {
            Long id = Long.valueOf(request.getParameter("id"));
            Tasks task = DBManager.getTask(id);
            request.setAttribute("task", task);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/html/taskDetails.jsp");
            dispatcher.forward(request, response);
            return;
        } else if ("update".equals(action)) {
            Long id = Long.valueOf(request.getParameter("id"));
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String deadlineDate = request.getParameter("deadlineDate");

            Tasks taskToUpdate = DBManager.getTask(id);
            if (taskToUpdate != null) {
                taskToUpdate.setName(name);
                taskToUpdate.setDescription(description);
                taskToUpdate.setDeadlineDate(deadlineDate);
            }
        }
        response.sendRedirect("/html/home.jsp");
    }
}