<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/resources/resources.jsp"/>
<jsp:include page="navbar.jsp"/>

<body class="bg-light">

<!-- Add Task Button -->
<div class="container">
    <button type="button" class="btn btn-primary btn-lg px-5" data-bs-toggle="modal" data-bs-target="#taskModal">
        Add Task
    </button>
</div>

<!-- Modal -->
<div class="modal fade" id="taskModal" tabindex="-1" role="dialog" aria-labelledby="taskModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="taskModalLabel">Add Task</h5>
            </div>
            <div class="modal-body">
                <form method="post" action="/TaskServlet">
                    <input type="hidden" name="action" value="add"/>
                    <div class="form-group mb-3">
                        <label>Name:</label>
                        <input type="text" class="form-control" name="name"/>
                    </div>
                    <div class="form-group mb-3">
                        <label>Description:</label>
                        <textarea class="form-control" name="description" rows="5"></textarea>
                    </div>
                    <div class="form-group mb-4">
                        <label>Deadline:</label>
                        <input type="date" class="form-control" name="deadlineDate"/>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Add Task"/>
                </form>
            </div>
        </div>
    </div>
</div>

<jsp:include page="tasksList.jsp"/>