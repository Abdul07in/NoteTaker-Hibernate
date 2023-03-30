package com.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.utility.FactoryProvider;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int id;
	RequestDispatcher rd = null;
       
    public DeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			id = Integer.parseInt(request.getParameter("noteId"));
			Session session = FactoryProvider.getFactory().openSession();
			Note note = (Note) session.get(Note.class, id);
			Transaction tx = session.beginTransaction();
			session.delete(note);
			tx.commit();
			session.close();
			request.setAttribute("msg", "Note Deleted Successfully");
			rd = request.getRequestDispatcher("showNote.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
