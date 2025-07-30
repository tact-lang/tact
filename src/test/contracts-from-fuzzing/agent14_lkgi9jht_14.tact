contract TestContract {
    a: Int = -5;
    b: Int as uint8 = 255;
    c: Int as int64 = -12345678;
    d: Int as uint4 = 12;
    e: Int as int1 = 0;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 0;
    }
}