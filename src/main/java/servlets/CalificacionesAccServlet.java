package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import modelsDAO.GradeDAO;

import java.io.IOException;

@WebServlet(name = "CalificacionesAccServlet", urlPatterns = "/calAcc")
public class CalificacionesAccServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession sess = req.getSession();
        int studentId = Integer.parseInt(req.getParameter("studentId"));
        String gradeParamName = "input_" + studentId;
        // Verificar si el parámetro está presente en la solicitud
        if (req.getParameterMap().containsKey(gradeParamName)) {
            String grade = req.getParameter(gradeParamName);
            float studentGrade = Float.parseFloat(grade);
            GradeDAO.updateInternshipGrade(studentId, studentGrade);
        }
        resp.sendRedirect("./jsp/calificacionesAcc.jsp");
    }
}
