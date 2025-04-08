contract TestContract {
    a: Int as uint4;
    b: Int as uint16;
    c: Int as int8;

    init() {
        self.a = 8;
        self.b = 256;
        self.c = -7;
    }
}