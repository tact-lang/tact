contract StaticOrderingTest {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint8;
    d: Int as uint4;

    init() {
        self.a = -5;
        self.b = 300;
        self.c = 255;
        self.d = 15;
    }
}