contract SmallBytes {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint1;

    init() {
        self.a = 1;
        self.b = -4;
        self.c = 0;
    }
}