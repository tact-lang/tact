// Contract with very long list of mixed primitive fields
contract LotsOfPrimitives {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Bool; g: Bool; h: Bool;
    i: String; j: String; k: String;
    l: Address; m: Address; n: Address;
    o: Cell; p: Cell;
    q: Slice; r: Slice;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5;
        self.f=true; self.g=false; self.h=true;
        self.i="1"; self.j="2"; self.k="3";
        self.l = myAddress(); self.m=myAddress(); self.n=myAddress();
        self.o=emptyCell(); self.p=emptyCell();
        self.q=emptyCell().asSlice(); self.r=emptyCell().asSlice();
    }
}