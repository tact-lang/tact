contract TestContract {
    a: Int as uint128;
    b: Int as int8;
    c: Int as uint1;

    init() {
        self.a = 100;
        self.b = -5;
        self.c = 1;
    }
}