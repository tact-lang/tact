contract TestContract {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint16;

    init() {
        self.a = 1;
        self.b = 5;
        self.c = 100;
        self.d = 2000;
    }
}