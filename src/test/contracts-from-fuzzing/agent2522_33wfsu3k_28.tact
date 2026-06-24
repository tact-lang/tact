contract TestContract {
    a: Int as int255;
    b: Int as uint255;
    c: Int as int1 = -1;
    d: Int as uint1 = 1;

    init() {
        self.a = 42;
        self.b = 43;
    }
}