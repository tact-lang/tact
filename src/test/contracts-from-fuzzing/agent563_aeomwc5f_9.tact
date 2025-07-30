contract LargeContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Address?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = 2;
        self.j = true;
        self.k = "def";
        self.l = myAddress();
        self.m = null;
        self.n = null;
        self.o = null;
        self.p = null;
    }
}