
<%@page import="java.sql.Statement"%>
<%@page import="com.mysql.cj.xdevapi.PreparableStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ibm.xtq.ast.nodes.Import"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="estilos.css">
	</head>
	<body>
		<H2>Usuarios Registrados</H2>		
			Usuario:<br/><br/>
		<table id="enfasis-columna">
			<tr>
				<td class="columna">Nombre:</td>
				<td><%=request.getParameter("Nombre") %></td>
			</tr>	
			<tr>
				<td class="columna">Apellido: </td>	
				<td><%=request.getParameter("Apellido") %> </td>
			</tr>
			<tr>
				<td class="columna">Usuario:</td>
				<td><%=request.getParameter("Usuario") %> </td>
			</tr>
			<tr>
				<td class="columna">Contraseña: </td>
				<td> <%=request.getParameter("Contrasena") %> </td>
			</tr>	
			<tr>
				<td class="columna">Pais: </td>
				<td><%=request.getParameter("Pais") %> </td>
			</tr>
			<tr>
				<td class="columna">Tecnología:</td>
				<td> <%=request.getParameter("Tecnologias") %></td>
			</tr>
		</table>	
		<br/>
		<br/>
		<%
			String nombre		=request.getParameter("Nombre");
			String apellido		=request.getParameter("Apellido");
			String usuario		=request.getParameter("Usuario");
			String contraseña	=request.getParameter("Contrasena");
			String pais			=request.getParameter("Pais");
			String tecnologia	=request.getParameter("Tecnologias");
			
			Class.forName("com.mysql.cj.jdbc.Driver");		
			
			Connection conn  = DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root", "admin");
			String QuerySQL	 = "INSERT INTO RegistroJSP (nombre, apellido, usuario, contraseña, pais, tecnologia) VALUE('"+nombre+"','"+apellido+"','"+usuario+"','"+contraseña+"','"+pais+"','"+tecnologia+"')";
			Statement st	 = conn.createStatement();
			
			st.executeUpdate(QuerySQL);						
		%>
		<jsp:include page="Fecha.jsp"></jsp:include>
	</body>
</html>