package Main;

public class Main {

    public static void main(String[] args) {

        Connector con = new Connector("localhost","root","");

        //Задание 1
        System.out.println("Задание 1: Входные данные - 2");
        con.task1(2);
        //Задание 2
        System.out.println("\nЗадание 2: Входные данные - 3");
        con.task2(3);
        //Задание 3
        System.out.println("\nЗадание 2: Входные данные - 'Вторник'");
        con.task3("Вторник");


    }
}
