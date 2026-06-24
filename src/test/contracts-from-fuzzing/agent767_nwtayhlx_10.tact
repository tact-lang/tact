contract ManyDirectVars {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as coins;
    e: Bool;
    f: Address?;
    g: Cell;
    h: Slice;
    i: String;
    j: Bool;
    k: Int;
    l: Int as uint8;
    m: Int as int16;
    n: Int as coins;
    o: Address?;
    p: String;
    q: Bool;
    r: Int;
    s: Cell;
    t: Slice;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=true; self.f=null; self.g=emptyCell(); self.h=emptyCell().asSlice();
        self.i="hi"; self.j=false; self.k=11; self.l=12; self.m=13; self.n=14; self.o=null; self.p="zz"; self.q=true; self.r=21; self.s=emptyCell(); self.t=emptyCell().asSlice();
    }
}
