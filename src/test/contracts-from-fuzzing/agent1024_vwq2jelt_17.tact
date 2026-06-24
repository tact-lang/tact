contract ManyContractFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int as uint8;
    h: Int as int16;
    i: Int as uint64;
    j: Int;
    k: Bool;
    l: String;
    m: Cell;
    n: Slice;
    o: Address;
    p: Int;

    init() {
        self.a=1; self.b=true; self.c="c"; self.d=emptyCell();
        self.e=emptyCell().asSlice(); self.f=myAddress(); self.g=2; self.h=3;
        self.i=4; self.j=5; self.k=false; self.l="l"; self.m=emptyCell();
        self.n=emptyCell().asSlice(); self.o=myAddress(); self.p=6;
    }
}