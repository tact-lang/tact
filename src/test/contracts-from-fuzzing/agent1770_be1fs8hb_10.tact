contract ManyVariables {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Int;
    g: Bool;
    h: String;
    i: Address;
    j: Cell;
    k: Int;
    l: Bool;
    m: String;
    n: Address;
    o: Cell;
    p: Int;
    q: Bool;
    r: String;
    s: Address;
    t: Cell;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "one";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = 2;
        self.g = true;
        self.h = "two";
        self.i = myAddress();
        self.j = emptyCell();
        self.k = 3;
        self.l = false;
        self.m = "three";
        self.n = myAddress();
        self.o = emptyCell();
        self.p = 4;
        self.q = true;
        self.r = "four";
        self.s = myAddress();
        self.t = emptyCell();
    }
}