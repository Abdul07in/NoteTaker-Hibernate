<%@page import="java.text.DateFormat"%>
<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
	<%@ include file="message.jsp"%>

	<div class="container mt-4">
		<h1 class=" display-3 text-center">All Notes</h1>
		<%
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from Note");
		
		List<Note> nlist = q.list();
		
		for(Note n : nlist){
		%>
		<div class="card mt-4">
			<div class="card-header indigo text-white">Note Id : <%=n.getId() %></div>
			<div class="card-body">
				<h5 class="card-title"><%= n.getTitle() %></h5>
				<p class="card-text"><%= n.getContent() %></p>
				<small><%= DateFormat.getDateTimeInstance(DateFormat.LONG,DateFormat.SHORT).format(n.getAddedDate()) %></small>
				
			</div>
			<div class="card-footer text-body-secondary">
			<a href="editNote.jsp?noteId=<%= n.getId() %>" class="btn btn-warning btn-sm text-white">Update</a>
			<a href="DeleteServlet?noteId=<%= n.getId() %>" class="btn btn-danger btn-sm">Delete</a>
			</div>
		</div>
		<%	
		}
		
		s.close();
		%>
	</div>
</body>
</html>