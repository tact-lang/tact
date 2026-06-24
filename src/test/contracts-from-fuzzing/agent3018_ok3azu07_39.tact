contract WeirdSerialization {
    s4: Int as uint4;
    s16: Int as int16;
    s120: Int as uint120;
    s251: Int as int251;

    init() {
        self.s4 = 15;
        self.s16 = 32767;
        self.s120 = 1329227995784915872903807060280344575;
        self.s251 = 36185027886661311069865932815214971204146870208012676262330495002472898729855;
    }
}
