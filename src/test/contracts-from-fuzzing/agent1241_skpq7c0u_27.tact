contract LargeFlat {
    a: Int as uint8 = 1;
    b: Int as int8 = -1;
    c: Int as uint16 = 2;
    d: Int as int16 = -2;
    e: Int as uint32 = 3;
    f: Int as int32 = -3;
    g: Int as uint64 = 4;
    h: Int as int64 = -4;
    i: Bool = true;
    j: String = "x";
    k: Bool = false;
    l: String = "y";

    init() {
        self.a = 10;
        self.b = -10;
        self.c = 20;
        self.d = -20;
        self.e = 30;
        self.f = -30;
        self.g = 40;
        self.h = -40;
        self.i = false;
        self.j = "xx";
        self.k = true;
        self.l = "yy";
    }
}
