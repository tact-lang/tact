struct L {
    z: Int;
    t: String;
    b: Bool;
}

contract BigFields {
    a: Int;
    b: String;
    c: Bool;
    d: Int;
    e: String;
    f: Bool;
    g: Int;
    h: String;
    i: Bool;
    j: Int;
    k: String;
    l: Bool;
    m: Int;
    n: String;
    o: Bool;
    p: Int;
    q: String;
    r: Bool;
    s: L;

    init() {
        self.a = 1;
        self.b = "b";
        self.c = true;
        self.d = 2;
        self.e = "e";
        self.f = false;
        self.g = 3;
        self.h = "h";
        self.i = true;
        self.j = 4;
        self.k = "k";
        self.l = false;
        self.m = 5;
        self.n = "n";
        self.o = true;
        self.p = 6;
        self.q = "q";
        self.r = false;
        self.s = L{z:1,t:"txt",b:true};
    }
}