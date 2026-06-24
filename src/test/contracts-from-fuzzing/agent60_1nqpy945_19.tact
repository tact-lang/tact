contract TestContract {
    a: Int as uint8 = 1;
    b: Int as int16 = -123;
    c: Int as uint32 = 123456;
    d: Int as int64 = -999999;

    init() {
        self.a = 2;
        self.b = -456;
        self.c = 654321;
        self.d = -888888;
    }
}