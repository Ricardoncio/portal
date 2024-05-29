package modelsDAO;

import connections.Conector;
import models.Grade;
import models.Subject;
import models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class GradeDAO {

    /**
     * Método utilizado para recuperar el nombre de una asignatura según su id.
     * @author Jose
     * @param subject_id Id de la asignatura.
     * @return String Nombre de la asignatura.
     */
    public static String getSubjectNameFromId (int subject_id){
        String name = null;
        Connection con = null;

        try {
            con = new Conector().getMySqlConnection();
            PreparedStatement getName = con.prepareStatement("Select subject_name from _subject where id = ?;");
            getName.setInt(1,subject_id);
            ResultSet rs = getName.executeQuery();
            if (rs.next()) {
                name = rs.getString(1);
            }

        } catch(SQLException e) {
            e.printStackTrace();
        } catch(ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return name;
    }

        /**
     * Método que se utiliza en calificacionesAlumno
     * @author Ricardo
     * @param subject_id
     * @param student
     * @return
     */
    public static List<Grade> getGradesFromSubjectId(int subject_id, User student) {
        List<Grade> grades = new ArrayList<>();
        Connection con = null;

        try {
            con = new Conector().getMySqlConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM grades WHERE subject_id = ? and student = ?;");
            ps.setInt(1,subject_id);
            ps.setInt(2,student.getId());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Grade grade = new Grade();
                grade.setSubject_id(rs.getInt("subject_id"));
                grade.setGrade((Double)rs.getObject("grade"));
                grade.setTeacher_id(rs.getInt("teacher"));
                grade.setStudent_id(rs.getInt("student"));
                if (grade.getGrade() != null) {
                    grades.add(grade);
                }
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return grades;
    }

    public static void updateGrade() {
        Connection con = null;

        try {
            con = new Conector().getMySqlConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE grades set grade = ? WHERE ");
            int result = ps.executeUpdate();
            if (result != 0){

            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static void updateInternshipGrade(int studentId, float studentGrade) {
        Connection con = null;

        try {
            con = new Conector().getMySqlConnection();
            try (PreparedStatement ps = con.prepareStatement("UPDATE internship set grade = ? WHERE student = ?;")) {
                ps.setFloat(1, studentGrade);
                ps.setInt(2, studentId);
                ps.executeUpdate();
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if(con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
