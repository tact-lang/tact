contract TestContract {
    a: Int as uint64;
    b: Int as int16;
    c: Int as int1;

    init() {
        self.a = 1234;
        self.b = -123;
        self.c = 1;
    }
}