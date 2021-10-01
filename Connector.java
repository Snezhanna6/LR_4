package Main;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class Connector {

    private final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
    private final String url;
    private final String login;
    private final String password;

    public Connector(String url, String login, String password) {
        this.url = url;
        this.login = login;
        this.password = password;
    }

    public Connection init()
            throws ClassCastException, SQLException, ClassNotFoundException {

        Connection out;
        Class.forName(JDBC_DRIVER);

        String connectionString = "jdbc:mysql://" + url + ":3306/College";

        out = DriverManager.getConnection(connectionString, login, password);

        return out;
    }

    //Задание 1
    public void task1(int kol){
        try {
            //SQL запрос для получения всех значений из БД
            String sql = "SELECT * FROM schedule";

            ResultSet res = init().prepareStatement(sql).executeQuery();
            int sl[] = new int[6];
            String nameDay[] = new String[]{"Понедельник","Вторник","Среда","Четверг"
            ,"Пятница","Суббота"};

            while (res.next()) {
                switch (res.getString("day")){
                    case "Понедельник": sl[0]++; break;
                    case "Вторник": sl[1]++; break;
                    case "Среда": sl[2]++; break;
                    case "Четверг": sl[3]++; break;
                    case "Пятница": sl[4]++; break;
                    case "Суббота": sl[5]++; break;
                    default: break;
                }

            }

            for (int i = 0; i < sl.length; i++)
                if (sl[i] == kol)
                    System.out.println(nameDay[i]);



        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

    }

    //Задание 2(смотрит только количество не одинаковых аудиторий)
    public void task2(int kol){
        try {
            //SQL запрос для получения всех значений из БД
            String sql = "SELECT * FROM schedule";

            ResultSet res = init().prepareStatement(sql).executeQuery();

            int sl[] = new int[6];
            String[] kab = new String[]{"","","","","",""};
            String nameDay[] = new String[]{"Понедельник","Вторник","Среда","Четверг"
                    ,"Пятница","Суббота"};

            while (res.next()) {
                switch (res.getString("day")){
                    case "Понедельник":
                        if (kab[0].indexOf(res.getString("classroom")) == -1) {
                            kab[0] +=  res.getString("classroom") + " ";
                            sl[0]++;
                        } break;
                    case "Вторник":
                        if (kab[1].indexOf(res.getString("classroom")) == -1) {
                            kab[1] +=  res.getString("classroom") + " ";
                            sl[1]++;
                        } break;
                    case "Среда":
                        if (kab[2].indexOf(res.getString("classroom")) == -1) {
                            kab[2] +=  res.getString("classroom") + " ";
                            sl[2]++;
                        } break;
                    case "Четверг":
                        if (kab[3].indexOf(res.getString("classroom")) == -1) {
                            kab[3] +=  res.getString("classroom") + " ";
                            sl[3]++;
                        } break;
                    case "Пятница":
                        if (kab[4].indexOf(res.getString("classroom")) == -1) {
                            kab[4] +=  res.getString("classroom") + " ";
                            sl[4]++;
                        } break;
                    case "Суббота":
                        if (kab[5].indexOf(res.getString("classroom")) == -1) {
                            kab[5] +=  res.getString("classroom") + " ";
                            sl[5]++;
                        } break;
                    default: break;
                }

            }

            for (int i = 0; i < sl.length; i++)
                if (sl[i] == kol)
                    System.out.println(nameDay[i]);



        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    //Задание 3
    public void task3(String day){

        //SQL запрос для поиска записи с минимальным ID и выбранного дня недели
        String sql1 = "SELECT * FROM schedule WHERE ID IN (SELECT MIN(ID) FROM schedule WHERE Day = '" + day + "')";

        try {

            ResultSet res = init().prepareStatement(sql1).executeQuery();
            String mass[] = new String[6];
            while (res.next()) {
                mass[0] = res.getString(1);
                mass[1] = res.getString(2);
                mass[2] = res.getString(3);
                mass[3] = res.getString(4);
                mass[4] = res.getString(5);
                mass[5] = res.getString(6);
                break;
            }

            //SQL запрос для удаления записи
            String sql2 = "DELETE FROM schedule WHERE ID = " + mass[0];
            //Удаление записи
            init().prepareStatement(sql2).executeUpdate();

            String sql3 = "INSERT INTO schedule (Teacher, Subject, Day, classroom, Quantity) value ("
                    + Integer.parseInt(mass[1]) + ","
                    + Integer.parseInt(mass[2]) + ",'"
                    + mass[3] + "','"
                    + mass[4] + "',"
                    + Integer.parseInt(mass[5]) + ")";

            //Вставка новой записи в конец БД
            init().prepareStatement(sql3).executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

    }
}
