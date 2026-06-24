contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;
    o: String;
    p: String;
    q: Cell;
    r: Cell;
    s: Address;
    t: Address;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=6; self.g=7; self.h=8; self.i=9; self.j=10;
        self.k=true; self.l=false; self.m=true; self.n=false;
        self.o="foo"; self.p="bar";
        self.q=emptyCell(); self.r=emptyCell();
        self.s=myAddress(); self.t=myAddress();
    }
}
