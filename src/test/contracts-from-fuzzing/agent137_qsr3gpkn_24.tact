contract IntSerializationTest {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;

    init() {
        self.a = -128;
        self.b = 255;
        self.c = -32768;
        self.d = 65535;
    }

    receive() {}
}