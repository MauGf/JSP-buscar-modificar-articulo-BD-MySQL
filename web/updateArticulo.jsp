<%-- 
    Document   : updateArticulo
    Created on : 29-ago-2017, 23:18:19
    Author     : Mau
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Materialize -->
    <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css">
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/produccion", "root", "");
      Statement s = conexion.createStatement();
      request.setCharacterEncoding("UTF-8");
      // Comprueba si el id de Codigo de articulo ya existe
      String consulta = "SELECT COUNT(*) FROM articulo WHERE ArtCodigo='"
              + request.getParameter("codarticulo")
              + "'";
      ResultSet coincidencias = s.executeQuery(consulta);
      coincidencias.next();
      if (coincidencias.getInt(1) != 0) {
        out.print("<script type=\"text/javascript\">alert(\"Lo siento, el código " + request.getParameter("codarticulo") + " ya existe\");</script>");
        out.print("<script>document.location = \"index.jsp\"</script>");
      } else {
        // Inserta los datos en la base de datos
        String insercion = "INSERT INTO articulo VALUES ('"
                + request.getParameter("ArtCodigo")
                + "', '" + request.getParameter("ArtNombre")
                + "', '" + request.getParameter("ProCodigo")
                + "', '" + request.getParameter("CatCodigo")
                + "', '" + request.getParameter("ArtPrecio")
                + "', '" + request.getParameter("ArtStock");
        out.print(insercion);
        s.execute(insercion);
        conexion.close();
      }
    %>
    <script>document.location = "index.jsp";</script>
  </body>
</html>
