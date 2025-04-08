contract LargeContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Address;
    h: Cell;
    i: Bool;
    j: String;
    k: Int;
    l: Int;
    m: Bool;
    n: Address;
    o: String;
    p: Int;
    q: Int;
    r: String;
    s: Bool;
    t: Int;

    init() {
        self.a=1; self.b=true; self.c="c"; self.d=4; self.e=false;
        self.f="f"; self.g=myAddress(); self.h=emptyCell(); self.i=true; self.j="j";
        self.k=11; self.l=12; self.m=false; self.n=myAddress(); self.o="o";
        self.p=16; self.q=17; self.r="r"; self.s=true; self.t=20;
    }
}