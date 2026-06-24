contract ChainNestedPrimitives {
    a: Int; b: Bool; c: Cell; d: Slice; e: String; f: Address;
    g: Int; h: Bool; i: Cell; j: Slice; k: String; l: Address;

    init() {
        self.a=1; self.b=true; self.c=emptyCell(); self.d=emptyCell().asSlice(); self.e="x"; self.f=myAddress();
        self.g=2; self.h=false; self.i=emptyCell(); self.j=emptyCell().asSlice(); self.k="y"; self.l=myAddress();
    }
}