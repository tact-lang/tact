contract LargeMixed {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Address;
    g: Address?;
    h: Bool?;
    i: Int as int32;
    j: Int as uint64;
    k: Int? as uint32;
    l: Bool = true;
    init() {
        self.a = 1;
        self.b = false;
        self.c = "test";
        self.d = null;
        self.e = null;
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = -100;
        self.j = 1000;
        self.k = null;
        self.l = false;
    }
}