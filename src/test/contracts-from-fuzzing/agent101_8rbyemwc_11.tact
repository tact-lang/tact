contract TestContract {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;

    init() {
        self.a = 10;
        self.b = 123;
        self.c = -5;
    }
}