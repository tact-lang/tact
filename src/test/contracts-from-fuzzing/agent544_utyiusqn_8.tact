contract TestContract {
    a: Int = 17;
    b: Int as uint8 = 255;
    c: Int as int64 = -123456789;

    init() {
        self.a = 42;
        self.b = 200;
        self.c = -987654321;
    }
}