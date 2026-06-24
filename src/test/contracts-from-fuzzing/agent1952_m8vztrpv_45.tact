contract WideAndOptional {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String?;
    i: Address;
    j: Slice?;
    k: Int;
    l: Bool;
    m: String?;
    n: Int?;
    o: Bool?;
    p: Address;
    q: Slice;
    r: Int?;
    s: Bool;
    t: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "foo";
        self.d = null;
        self.e = emptyCell().asSlice();
        self.f = null;
        self.g = false;
        self.h = null;
        self.i = myAddress();
        self.j = emptyCell().asSlice();
        self.k = -42;
        self.l = false;
        self.m = "bar";
        self.n = 777;
        self.o = null;
        self.p = myAddress();
        self.q = emptyCell().asSlice();
        self.r = null;
        self.s = true;
        self.t = "baz";
    }
}
