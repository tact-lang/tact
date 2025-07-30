contract FlatHuge {
    a0: Int; a1: Int; a2: Int; a3: Int; a4: Int; a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool; b6: Bool; b7: Bool; b8: Bool; b9: Bool;
    c0: String; c1: String; c2: String; c3: String; c4: String; c5: String; c6: String; c7: String; c8: String; c9: String;
    d0: Cell; d1: Cell; d2: Cell; d3: Cell; d4: Cell; d5: Cell; d6: Cell; d7: Cell; d8: Cell; d9: Cell;
    e0: Address; e1: Address; e2: Address; e3: Address; e4: Address; e5: Address; e6: Address; e7: Address; e8: Address; e9: Address;
    f0: Slice; f1: Slice; f2: Slice; f3: Slice; f4: Slice;
    
    init() {
        self.a0=0; self.a1=1; self.a2=2; self.a3=3; self.a4=4; self.a5=5; self.a6=6; self.a7=7; self.a8=8; self.a9=9;
        self.b0=true; self.b1=false; self.b2=true; self.b3=false; self.b4=true; self.b5=false; self.b6=true; self.b7=false; self.b8=true; self.b9=false;
        self.c0="a"; self.c1="b"; self.c2="c"; self.c3="d"; self.c4="e"; self.c5="f"; self.c6="g"; self.c7="h"; self.c8="i"; self.c9="j";
        self.d0=emptyCell(); self.d1=emptyCell(); self.d2=emptyCell(); self.d3=emptyCell(); self.d4=emptyCell(); self.d5=emptyCell(); self.d6=emptyCell(); self.d7=emptyCell(); self.d8=emptyCell(); self.d9=emptyCell();
        self.e0=myAddress(); self.e1=myAddress(); self.e2=myAddress(); self.e3=myAddress(); self.e4=myAddress(); self.e5=myAddress(); self.e6=myAddress(); self.e7=myAddress(); self.e8=myAddress(); self.e9=myAddress();
        self.f0=emptyCell().asSlice(); self.f1=emptyCell().asSlice(); self.f2=emptyCell().asSlice(); self.f3=emptyCell().asSlice(); self.f4=emptyCell().asSlice();
    }
}