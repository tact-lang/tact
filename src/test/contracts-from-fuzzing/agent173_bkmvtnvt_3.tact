contract LongFields {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Bool;
    e: String;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Int as uint256;
    j: Int as int257;
    k: Int as uint1;
    l: Int as int1;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = "hello";
        self.f = 5;
        self.g = false;
        self.h = "world";
        self.i = 9;
        self.j = -10;
        self.k = 1;
        self.l = -1;
    }
}