contract TestContract {
    a: Int as int4 = 3;
    b: Int as uint4 = 8;
    c: Int as int12 = -12;
    d: Int as uint20 = 1;
    e: Int as int32 = 2;

    init() {
        self.a = 1;
        self.b = 10;
        self.c = -11;
        self.d = 2;
        self.e = 3;
    }
}