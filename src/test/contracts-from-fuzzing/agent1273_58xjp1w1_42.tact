contract SerializationCombo {
    a: Int as uint3;
    b: Int as uint8;
    c: Int as int16;
    d: Int as int257;

    init() {
        self.a=7;
        self.b=255;
        self.c=-32768;
        self.d=0;
    }
}