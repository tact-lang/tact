contract ManyFields {
    a: Bool;
    b: Bool;
    c: Int;
    d: Int;
    e: Bool;
    f: Int;
    g: Bool;
    h: Int;
    i: Bool;
    j: Int;
    k: Bool;
    l: Int;
    m: Bool;
    n: Int;
    o: Bool;
    p: Int;
    q: Bool;
    r: Int;
    s: Bool;
    t: Int;

    init() {
        self.a=true; self.b=false; self.c=1; self.d=2; self.e=true; self.f=3;
        self.g=false; self.h=4; self.i=true; self.j=5;
        self.k=false; self.l=6; self.m=true; self.n=7;
        self.o=false; self.p=8; self.q=true; self.r=9;
        self.s=false; self.t=10;
    }

    receive() {
        self.a=false;
    }
}