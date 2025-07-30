contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: Int = 1;
    d: Bool = true;
    e: String = "";
    f: Address;
    g: Int = 7;
    h: Bool = false;
    i: Int = 8;
    j: Bool = true;
    k: String = "abc";
    l: Address;
    m: Int = -1;
    n: Bool = false;
    o: Int = 42;
    p: Bool = true;
    q: String = "xyz";
    r: Address;
    s: Int = 100;
    t: Bool = false;

    init() {
        self.a = 1; self.b = true; self.c = 2; self.d = false;
        self.e = "test"; self.f = myAddress(); self.g = 3; self.h = true;
        self.i = 4; self.j = false; self.k = "k"; self.l = myAddress();
        self.m = 5; self.n = true; self.o = 6; self.p = false;
        self.q = "q"; self.r = myAddress(); self.s = 7; self.t = true;
    }
}