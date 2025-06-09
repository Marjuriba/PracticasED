package org.example;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TemperaturaControlTest {

    //CAJA BLANCA: Pruebas de caminos internos
    @ParameterizedTest
    @CsvSource({
            "5, 1",     //Temperatura muy baja
            "35, 2",    //Temperatura muy alta
            "15, 3",    //Caso especial para prueba de caja blanca
            "25, 0"     //Temperatura válida
    })
    @DisplayName("Caja Blanca - Ajustar Temperatura")
    void testAjustarTemperaturaCajaBlanca(int nuevaTemp, int esperado) {
        TemperaturaControl control = new TemperaturaControl();
        int resultado = control.ajustarTemperatura(nuevaTemp);
        assertEquals(esperado, resultado);
    }

    //CAJA NEGRA: Entrada-salida sin importar el código interno
    @ParameterizedTest
    @CsvSource({
            "25, 25, 0",     //Caso válido
            "5, 20, 1",      //Demasiado baja, no cambia
            "35, 20, 2",     //Demasiado alta, no cambia
            "15, 20, 3"      //Caso especial
    })
    @DisplayName("Caja Negra - Ajustar Temperatura")
    void testAjustarTemperaturaCajaNegra(int entrada, int esperadaTemp, int esperadoCod) {
        TemperaturaControl control = new TemperaturaControl();
        int resultado = control.ajustarTemperatura(entrada);
        assertEquals(esperadoCod, resultado);
        assertEquals(esperadaTemp, control.temperaturaActual);
    }

    @ParameterizedTest
    @CsvSource({
            "5, 25",     //+5 -> 20+5 = 25
            "-15, 20",   //-15 -> 20-15 = 5 → fuera de rango, no cambia
            "11, 20",    //+11 -> 31 → fuera de rango, no cambia
            "-10, 10"    //-10 -> 10, borde inferior válido
    })
    @DisplayName("Caja Negra - Modificar Temperatura")
    void testModificarTemperatura(int cambio, int esperadoTemp) {
        TemperaturaControl control = new TemperaturaControl();
        control.modificarTemperatura(cambio);
        assertEquals(esperadoTemp, control.temperaturaActual);
    }
}