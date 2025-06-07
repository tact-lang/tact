contract SmallFields {
    a: Int as int8;
    b: Int as int16;
    c: Int as uint4;
    d: Int as uint1;

    init() {
        self.a = -5;
        self.b = 42;
        self.c = 7;
        self.d = 1;
    }
}