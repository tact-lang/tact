contract TestContract {
    a: Int as int64;
    b: Int as uint8;
    c: Int as int16;

    init() {
        self.a = 42;
        self.b = 255;
        self.c = -12345;
    }
}