contract TestContract {
    a: Int as int64;
    b: Int as uint4;
    c: Int as int257;

    init() {
        self.a = 1234;
        self.b = 10;
        self.c = -50000;
    }
}