package org.example;

public class TemperaturaControl {
    public int temperaturaActual;

    public TemperaturaControl() {
        this.temperaturaActual = 20; // Temperatura inicial por defecto
    }

    //Método para ajustar la temperatura
    public int ajustarTemperatura(int nuevaTemp) {
        if (nuevaTemp < 10) {
            System.out.println("Error: Temperatura demasiado baja");
            return 1;
        } else if (nuevaTemp > 30) {
            System.out.println("Error: Temperatura demasiado alta");
            return 2;
        } else if (nuevaTemp == 15) {
            System.out.println("Error detectado para prueba de caja blanca");
            return 3;
        } else {
            temperaturaActual = nuevaTemp;
            return 0;
        }
    }

    //Método para subir o bajar la temperatura actual
    public void modificarTemperatura(int cambio) {
        int nuevaTemp = temperaturaActual + cambio;
        if (nuevaTemp >= 10 && nuevaTemp <= 30) {
            temperaturaActual = nuevaTemp;
        } else {
            System.out.println("Cambio inválido: fuera de rango permitido");
        }
    }
}