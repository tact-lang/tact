// Wide contract with mixed serialization options
contract Mix {
    a: Int;
    b: Int as int8;
    c: Int as uint64;
    d: Int as int16;
    e: Int as coins;
    f: Int;
    g: Int as uint4;
    h: Bool;
    i: Bool;
    j: Bool;

    init() {
        self.a = -1;
        self.b = -128;
        self.c = 123456789;
        self.d = 32767;
        self.e = ton("5");
        self.f = 1000;
        self.g = 15;
        self.h = true;
        self.i = false;
        self.j = true;
    }
}
