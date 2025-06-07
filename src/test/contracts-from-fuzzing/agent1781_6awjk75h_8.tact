contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Bool;
    g: String;
    h: String;
    i: String;
    j: Address;
    k: Address;
    l: Slice;
    m: Slice;
    n: Cell;
    o: Cell;

    init() {
        self.a=1; self.b=2; self.c=3;
        self.d=true; self.e=false; self.f=true;
        self.g="x"; self.h="y"; self.i="z";
        self.j = myAddress(); self.k = myAddress();
        self.l = emptyCell().asSlice(); self.m = emptyCell().asSlice();
        self.n = emptyCell(); self.o = emptyCell();
    }
}