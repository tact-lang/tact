contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint24;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int as uint256;
    h: Bool;
    i: Bool;
    j: Bool;
    k: String;
    init() {
        self.a = 1;
        self.b = -2;
        self.c = 3;
        self.d = -4;
        self.e = 5;
        self.f = -6;
        self.g = 7;
        self.h = true;
        self.i = false;
        self.j = true;
        self.k = "test";
    }
}