package com.bookshelf.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.bookshelf.dao.ApplicationDao;
import com.bookshelf.libs.DBType;

public class DBUtil {
    private static final String USERNAME = "bookshelf_admin";
    private static final String PASSWORD = "admin_123";
    private static String M_CONN_STRING = "jdbc:mysql://localhost/";
    private static String H_CONN_STRING = "jdbc:hsqldb://localhost/";

    public static Connection getConnection(DBType dbType) throws SQLException, ClassNotFoundException {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        switch (dbType) {
            case MYSQL:
                return DriverManager.getConnection(M_CONN_STRING, USERNAME, PASSWORD);
            case HSQLDB:
                return DriverManager.getConnection(H_CONN_STRING, USERNAME, PASSWORD);
            default:
                return null;
        }
    }

    public static void setConnStr() {
        // Append the database name to the connection strings if not already included
        if (!M_CONN_STRING.contains(ApplicationDao.DB_NAME)) {
            M_CONN_STRING += ApplicationDao.DB_NAME;
            H_CONN_STRING += ApplicationDao.DB_NAME;
        }
    }

    public static void processException(SQLException e) {
        System.err.println("Error message: " + e.getMessage());
        System.err.println("Error code: " + e.getErrorCode());
        System.err.println("SQL State: " + e.getSQLState());
        System.err.println("Trace project package: " + printRelevantStackTrace(e) + "\n");
    }

    private static String printRelevantStackTrace(Throwable e) {
        int i = 0;
        for (StackTraceElement element : e.getStackTrace()) {
            i++;
            // Update the package filter for stack traces
            if (element.getClassName().startsWith("com.bookshelf")) {
                return "Relevant stack trace element[" + i + "]: " + element;
            }
        }
        return "not found";
    }
}
