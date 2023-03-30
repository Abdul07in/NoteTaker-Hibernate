package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.utility.FactoryProvider;

public class UpdateNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int id;
	private String title;
	private String content;
	RequestDispatcher rd = null;

	public UpdateNoteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			id = Integer.parseInt(request.getParameter("id"));
			title = request.getParameter("title");
			content = request.getParameter("content");
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			Note note = (Note) s.get(Note.class, id);
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());

			tx.commit();
			s.close();

			request.setAttribute("msg", "Note Updated Successfully");
			rd = request.getRequestDispatcher("showNote.jsp");
			rd.forward(request, response);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
