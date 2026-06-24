contract TestContract {
    a: Int as int64 = 1;
    b: Int as uint32 = 2;
    c: Int as uint4 = 3;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 2;
    }
}
