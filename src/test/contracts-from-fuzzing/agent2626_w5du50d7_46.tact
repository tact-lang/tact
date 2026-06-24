contract DifferentSerializations {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint7;
    d: Int as int9;

    init() {
        self.a = 10;
        self.b = -5;
        self.c = 100;
        self.d = -100;
    }
}