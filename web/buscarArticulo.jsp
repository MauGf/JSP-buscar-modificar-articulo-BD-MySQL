<%-- 
    Document   : buscarArticulo
    Created on : 29-ago-2017, 23:15:53
    Author     : Mau
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

   <title>Consulta Base de Datos</title>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/produccion","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");

      ResultSet listado = s.executeQuery ("SELECT COUNT(*) FROM articulo WHERE ArtNombre LIKE '%" + request.getParameter("nombre") + "%'");
      listado.next();
      int coincidencias = listado.getInt(1);

      // Si no se encuentra ningún articulo con el nombre especificado,
      // volvemos a la página principal.
      if (coincidencias == 0) {
        out.println("<script>document.location = \"index.jsp\"</script>");
      }

      ResultSet listado2 = s.executeQuery ("SELECT * FROM articulo WHERE ArtNombre LIKE '%" + request.getParameter("nombre") + "%'");

      // Si hay un único articul con el nombre especificado, vamos directamente
      // a la página de detalle.
      if (coincidencias == 1) {
        listado2.next();
        out.println("<script>document.location = \"detalleArticulo.jsp?codarticulo=" + listado2.getInt("ArtCodigo") + "\"</script>");
      }

      // Si hay varios articulos cuyos nombres coinciden con el patrón buscado,
      // se muestran todos esos nombres para que el usuario elija.
      if (coincidencias > 1) {
        %>
          <div class="container">
            <div class="row"></div>
            <div class="row">
              <div class="col s3 m3 l3">&nbsp;</div>
              <div class="col s6 m6 l6">
                <div class="card grey lighten-5">
                  <h3 class="center">A r t i c u l o s </h3>
                  <table class="striped">
                  <thead><th>Nombre</th><th></th></thead>
                  <%
                  while (listado2.next()) {
                    %>
                    <tr>
                      <td><%=listado2.getString("ArtNombre") %></td>
                      <form method="post" action="detalleArticulo.jsp">
                        <input type="hidden" name="codarticulo" value="<%=listado2.getString("ArtCodigo") %>">
                         <td>
                        <button class="btn waves-effect waves-light center  teal darken-1" type="submit" name="editar">
                          <i class="fa fa-plus-circle"></i> Detalle
                        </button>
                        </td>
                      </form>
                    </tr>
                    <%
                  } // while
                  %>
                </table>
              </div>
            </div>
            <div class="col s3 m3 l3"></div>
      <%
      } // if
      conexion.close();
    %>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <!-- Materialize -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js"></script>
  </body>
</html>
