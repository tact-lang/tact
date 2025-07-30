contract LargeInit {
    a: Int; b: Bool; c: Address; d: Cell; e: Slice; f: String;
    g: Int; h: Bool; i: Address; j: Cell; k: Slice; l: String;
    m: Int; n: Bool; o: Address; p: Cell; q: Slice; r: String;

    init() {
        self.a=1; self.b=true; self.c=myAddress(); self.d=emptyCell(); self.e=emptyCell().asSlice(); self.f="1";
        self.g=2; self.h=false; self.i=myAddress(); self.j=emptyCell(); self.k=emptyCell().asSlice(); self.l="2";
        self.m=3; self.n=true; self.o=myAddress(); self.p=emptyCell(); self.q=emptyCell().asSlice(); self.r="3";
    }
}
