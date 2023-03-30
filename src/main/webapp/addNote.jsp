<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Note</title>
<%@ include file="link.jsp" %>
</head>
<body class="indigo-light text-black">
<%@ include file="navbar.jsp" %>
<%@ include file="message.jsp" %>

<div class="container mt-5">
<h1 class="display-3 text-center">Add Notes</h1>
	<form action="SaveNoteServlet" method="post">
  <div class="mb-3">
    <label for="title" class="form-label">Note Title</label>
    <input type="text" class="form-control" id="title" name="title" placeholder="Enter Note Content" required>
  </div>
  <div class="mb-3">
    <label for="content" class="form-label">Note Content</label>
    <textarea class="form-control" id="content" name="content" style="height: 200px" placeholder="Enter Note Content" required></textarea>
    
  </div>
  <div class="container text-center">
  <button type="submit" class="btn btn-warning text-muted" id="liveToastBtn">Submit</button>
  </div>
</form>

</div>
</body>
</html>