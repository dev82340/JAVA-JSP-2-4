<%@ page import="model.Tasks" %>
<%@ page import="db.DBManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container mt-4">
    <table class="table">
        <thead>
        <tr>
            <th>Name</th>
            <th>Description</th>
            <th>Deadline</th>
            <th>ID</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Tasks task : DBManager.getAllTasks()) { %>
        <tr>
            <td><%= task.getName() %>
            </td>
            <td><%= task.getDescription() %>
            </td>
            <td><%= task.getDeadlineDate() %>
            </td>
            <td><%= task.getId() %>
            </td>
            <td>
                <!-- Details Button -->
                <form method="post" action="/TaskServlet" style="display:inline;">
                    <input type="hidden" name="action" value="details"/>
                    <input type="hidden" name="id" value="<%=task.getId()%>"/>
                    <input type="submit" class="btn btn-primary btn-sm" value="Details"/>
                </form>
                <!-- Delete Button -->
                <form method="post" action="/TaskServlet" style="display:inline;">
                    <input type="hidden" name="action" value="delete"/>
                    <input type="hidden" name="id" value="<%=task.getId()%>"/>
                    <input type="submit" class="btn btn-danger btn-sm" value="Delete"/>
                </form>
            </td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>