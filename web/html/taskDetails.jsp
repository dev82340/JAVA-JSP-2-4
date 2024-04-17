<%@ page import="model.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/resources/resources.jsp"/>
<jsp:include page="navbar.jsp"/>

<body class="bg-light">
<div class="container mt-4">
    <h1>Task Details</h1>
    <div class="card">
        <div class="card-body">
            <% Tasks task = (Tasks) request.getAttribute("task");
                if (task != null) { %>
            <form action="/TaskServlet" method="post">
                <input type="hidden" name="action" value="update"/>
                <input type="hidden" name="id" value="<%= task.getId() %>"/>
                <div class="form-group mb-3">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" value="<%= task.getName() %>"/>
                </div>
                <div class="form-group mb-3">
                    <label for="description">Description:</label>
                    <textarea class="form-control" id="description" name="description"
                              rows="5"><%= task.getDescription() %></textarea>
                </div>
                <div class="form-group mb-4">
                    <label for="deadlineDate">Deadline:</label>
                    <input type="date" class="form-control" id="deadlineDate" name="deadlineDate"
                           value="<%= task.getDeadlineDate() %>"/>
                </div>
                <button type="submit" class="btn btn-primary">Update Task</button>
                <a href="/html/home.jsp" class="btn btn-secondary">Back to Task List</a>
            </form>
            <% } else { %>
            <p>Task not found.</p>
            <% } %>
        </div>
    </div>
</div>