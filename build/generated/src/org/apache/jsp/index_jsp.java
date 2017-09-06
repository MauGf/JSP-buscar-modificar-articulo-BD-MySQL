package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <!-- Materialize -->\n");
      out.write("        <link href=\"http://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/css/materialize.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css\">\n");
      out.write("        <title>Categoria en un control “lista desplegable”</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/produccion", "root", "practicaphp");
            Statement s = conexion.createStatement();
            request.setCharacterEncoding("UTF-8");
            ResultSet listado = s.executeQuery("SELECT * FROM articulo");
        
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\"></div>\n");
      out.write("            <div class=\"row s12 m12 l12\">\n");
      out.write("                <div class=\"card grey lighten-5\">\n");
      out.write("                    <h3 class=\"center\">Consultar Base de Datos</h3>\n");
      out.write("                    <br>\n");
      out.write("                    <div class=\"input-field col s6\">\n");
      out.write("                        <form class=\"bordered centered\" method=\"post\" action=\"buscarArticulo.jsp\">\n");
      out.write("                            <tr>\n");
      out.write("                                <td>\n");
      out.write("                                    <div class=\"input-field\">\n");
      out.write("                                        <input type=\"text\" name=\"nombre\" id=\"buscaNombre\">\n");
      out.write("                                        <label for=\"buscaNombre\">Nombre de Articulo</label>\n");
      out.write("                                    </div>\n");
      out.write("                                </td>\n");
      out.write("                                <td>\n");
      out.write("                                    <button class=\"btn waves-effect waves-light center\" type=\"submit\" name=\"aceptar\">\n");
      out.write("                                        <i class=\"fa fa-search\"></i> Buscar\n");
      out.write("                                    </button>\n");
      out.write("                                </td>\n");
      out.write("                            </tr>\n");
      out.write("                        </form>\n");
      out.write("                    </div>       \n");
      out.write("                    <br>\n");
      out.write("                    <table class=\"striped\">\n");
      out.write("                        <thead><th>Codigo de Articulo</th><th>Nombre</th><th>Precio de articulo</th><th></th><th></th></thead>\n");
      out.write("                            ");

                                while (listado.next()) {
                            
      out.write("\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print(listado.getString("ArtCodigo"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(listado.getString("ArtNombre"));
      out.write("</td>\n");
      out.write("                            <td>");
      out.print(listado.getString("ArtPrecio"));
      out.write("</td>\n");
      out.write("                        <form method=\"post\" action=\"modificaArticulo.jsp\">\n");
      out.write("                            <input type=\"hidden\" name=\"codarticulo\" value=\"");
      out.print(listado.getString("ArtCodigo"));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"nombre\" value=\"");
      out.print(listado.getString("ArtNombre"));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"procodigo\" value=\"");
      out.print(listado.getString("ProCodigo"));
      out.write("\">\n");
      out.write("                            <input type=\"hidden\" name=\"catcodigo\" value=\"");
      out.print(listado.getString("Catcodigo"));
      out.write("\"> \n");
      out.write("                            <input type=\"hidden\" name=\"precio\" value=\"");
      out.print(listado.getString("ArtPrecio"));
      out.write("\"> \n");
      out.write("                            <input type=\"hidden\" name=\"stock\" value=\"");
      out.print(listado.getString("ArtStock"));
      out.write("\">          \n");
      out.write("                            <td>\n");
      out.write("                                <button class=\"btn waves-effect waves-light center blue\" type=\"submit\" name=\"editar\">\n");
      out.write("                                    Editar\n");
      out.write("                                </button>\n");
      out.write("                            </td>\n");
      out.write("                        </form>           \n");
      out.write("                        </tr>\n");
      out.write("                        ");

                            }
                        
      out.write("       \n");
      out.write("                    </table>  \n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");

            conexion.close();
        
      out.write("\n");
      out.write("        <script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-2.1.1.min.js\"></script>\n");
      out.write("        <!-- Materialize -->\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.6/js/materialize.min.js\"></script>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
