contract WithSerialization {
    a: Int as int64 = 100;
    b: Int as uint32 = 1000;
    c: Int as uint1 = 1;
    d: Int = -10;

    init() {
        self.a = -50;
        self.b = 500;
        self.c = 0;
        self.d = 12345;
    }
}