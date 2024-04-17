package db;

import model.Tasks;

import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Tasks> tasksList = new ArrayList<>();
    private static long nextId = 1;

    public static void addTask(Tasks task) {
        task.setId(nextId++);
        tasksList.add(task);
    }

    public static Tasks getTask(Long id) {
        return tasksList.stream().filter(t -> t.getId().equals(id)).findFirst().orElse(null);
    }

    public static ArrayList<Tasks> getAllTasks() {
        return tasksList;
    }

    public static void deleteTask(Long id) {
        tasksList.removeIf(t -> t.getId().equals(id));
    }
}