contract BoolAndIntVariants {
    a: Int as int1;
    b: Int as int8;
    c: Int as int16;
    d: Int as int32;
    e: Int as int64;
    f: Int as int128;
    g: Int as int256;

    init() {
        self.a = 0;
        self.b = 1;
        self.c = 2;
        self.d = 3;
        self.e = 4;
        self.f = 5;
        self.g = 6;
    }
}