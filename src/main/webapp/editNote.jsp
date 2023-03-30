<%@page import="com.entities.Note"%>
<%@page import="com.utility.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Notes</title>
<%@ include file="link.jsp"%>
</head>
<body class="indigo-light">
	<%@ include file="navbar.jsp"%>

	<div class="container mt-4">
		<h1 class=" display-3 text-center">All Notes</h1>
		<%
			int noteId = Integer.parseInt(request.getParameter("noteId"));
			Session s = FactoryProvider.getFactory().openSession();
			Note note = (Note) s.load(Note.class, noteId);
			
		%>
		
		<form action="UpdateNoteServlet" method="post">
			<input type="hidden" name="id" value="<%= note.getId() %>"> 
			<div class="mb-3">
				<label for="title" class="form-label">Note Title</label> <input
					type="text" class="form-control" id="title" name="title"
					placeholder="Enter Note Content" value="<%= note.getTitle() %>" required>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea class="form-control" id="content" name="content"
					style="height: 200px" placeholder="Enter Note Content" required><%=note.getContent() %></textarea>

			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-warning text-muted"
					id="liveToastBtn">Save Note</button>
			</div>
		</form>
		
		<%
		s.close();
		%>

	</div>
</body>
</html>