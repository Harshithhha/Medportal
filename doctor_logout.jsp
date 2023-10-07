<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <%
	session.removeAttribute("doctor");					// destroy session of patient
//	session.removeAttribute("doctorErrorLogin");		// destroy session of patient
//	session.removeAttribute("NotAccepted");				// destroy session of patient
	session.removeAttribute("Error");
//	session.invalidate();
	response.sendRedirect("index.jsp");				// redirect to home page of system
%>