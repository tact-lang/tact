contract ManyFieldsPrimitives {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool;
    i: String; j: String; k: String;
    l: Address; m: Address;
    n: Cell; o: Cell;
    p: Slice; q: Slice;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=true; self.g=false; self.h=true;
        self.i="x"; self.j="y"; self.k="z";
        self.l=myAddress(); self.m=myAddress();
        self.n=emptyCell(); self.o=emptyCell();
        self.p=self.n.asSlice(); self.q=self.o.asSlice();
    }
}