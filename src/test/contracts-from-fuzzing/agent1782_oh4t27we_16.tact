contract SerialTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int257;

    init() {
        self.a = 1;
        self.b = -2;
        self.c = 300000;
        self.d = 7;
    }
}