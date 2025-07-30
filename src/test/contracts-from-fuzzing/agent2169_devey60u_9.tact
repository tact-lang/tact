contract FieldOrderTest {
    a: Int as uint8 = 1;
    b: Int as uint16 = 2;
    c: Int as uint32 = 3;
    d: Int as int64 = 4;
    e: Int as int128 = 5;
    f: Int = 6;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
        self.d = 40;
        self.e = 50;
        self.f = 60;
    }
}