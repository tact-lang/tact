contract DifferentSerials {
    a: Int as int8 = 5;
    b: Int as uint32 = 250;
    c: Int as uint1 = 1;

    init() {
        self.a = -5;
        self.b = 123456;
        self.c = 0;
    }
}