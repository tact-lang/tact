contract SerializationWidthsTest {
    a: Int as int8 = 1;
    b: Int as uint16 = 2;
    c: Int as coins = 3;

    init() {
        self.a = 10;
        self.b = 1000;
        self.c = 5000;
    }

    receive() {
        self.a = -5;
        self.b = 65535;
        self.c = 999999;
    }
}