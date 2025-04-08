// Large contract with a big mixed persistent state
contract Giant {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String = "";
    f: String?;
    g: Int as uint8;
    h: Int as int16;
    i: Int as uint32;
    j: Int as int64;
    k: Int? as int120;
    l: Int? as int200;
    m: Int as coins;
    n: Address;
    o: Address?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "hello";
        self.f = "world";
        self.g = 42;
        self.h = -1234;
        self.i = 99999;
        self.j = 555555;
        self.k = 12345;
        self.l = -888888;
        self.m = ton("15");
        self.n = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.o = null;
    }
}