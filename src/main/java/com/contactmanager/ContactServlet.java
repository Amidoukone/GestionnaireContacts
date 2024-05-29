package com.contactmanager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/contacts")
public class ContactServlet extends HttpServlet {
    private List<Contact> contacts = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("contacts", contacts);
        req.getRequestDispatcher("/contacts.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            addContact(req, resp);
        } else if ("update".equals(action)) {
            updateContact(req, resp);
        } else if ("delete".equals(action)) {
            deleteContact(req, resp);
        }
    }

    private void addContact(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String nom = req.getParameter("nom");
        String numeroTelephone = req.getParameter("numeroTelephone");
        String ville = req.getParameter("ville");
        String profession = req.getParameter("profession");

        Contact contact = new Contact(nom, numeroTelephone, ville, profession);
        contacts.add(contact);

        resp.sendRedirect("contacts");
    }

    private void updateContact(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String nom = req.getParameter("nom");
        String numeroTelephone = req.getParameter("numeroTelephone");
        String ville = req.getParameter("ville");
        String profession = req.getParameter("profession");

        for (Contact contact : contacts) {
            if (contact.getId() == id) {
                contact.setNom(nom);
                contact.setNumeroTelephone(numeroTelephone);
                contact.setVille(ville);
                contact.setProfession(profession);
                break;
            }
        }

        resp.sendRedirect("contacts");
    }

    private void deleteContact(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        contacts.removeIf(contact -> contact.getId() == id);

        resp.sendRedirect("contacts");
    }
}
