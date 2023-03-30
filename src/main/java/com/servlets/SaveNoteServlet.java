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

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String title;
	private String content;
	RequestDispatcher rd = null;

	public SaveNoteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			title = request.getParameter("title");
			content = request.getParameter("content");
			Note note = new Note(title, content, new Date());
			
			//Hibernate Save
			
			Session session = FactoryProvider.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();
			
			request.setAttribute("msg", "Note Added Successfully");
			rd = request.getRequestDispatcher("addNote.jsp");
			rd.forward(request, response);
			
			

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
