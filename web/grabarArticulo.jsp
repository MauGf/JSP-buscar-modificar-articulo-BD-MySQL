<%-- 
    Document   : grabarArticulo
    Created on : 29-ago-2017, 23:21:13
    Author     : Mau
--%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <%  
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/produccion","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      s.execute("UPDATE articulo SET ArtNombre='" + request.getParameter("nombre") + "', ProCodigo='" + request.getParameter("procodigo") + "', CatCodigo='" + request.getParameter("catcodigo") + "',ArtPrecio='" + request.getParameter("precio") + "', ArtStock='" + request.getParameter("stock") + "' WHERE ArtCodigo=" + request.getParameter("codarticulo"));

      conexion.close();
    %>
    <script>document.location = "index.jsp";</script>
  </body>
</html>
