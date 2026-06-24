contract LargePrimitives {
    a: Int;
    b: Int as int64;
    c: Int as uint64;
    d: Int as int32;
    e: Int as uint32;
    f: Int as int16;
    g: Int as uint16;
    h: Int as int8;
    i: Int as uint8;
    j: Bool;
    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = 7;
        self.h = 8;
        self.i = 9;
        self.j = true;
    }
}