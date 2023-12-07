// test_chuck.ck
// Configuración del driver JACK
adc => blackhole;

SinOsc s => dac;

while (true) {
    440 => s.freq;
    1::second => now;
}


