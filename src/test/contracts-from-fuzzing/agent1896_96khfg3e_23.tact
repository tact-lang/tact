contract FieldOrderTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
    d: Int as uint32;

    init() {
        self.a = 1;
        self.b = -100;
        self.c = 50000;
        self.d = 65535;
    }
}