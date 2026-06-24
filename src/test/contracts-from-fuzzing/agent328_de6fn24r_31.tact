contract Huge {
    a1: Int; a2: Bool; a3: Int?; a4: Bool?; a5: String; a6: Address; a7: Slice; a8: Cell;
    b1: Int; b2: Bool; b3: Int?; b4: Bool?; b5: String; b6: Address; b7: Slice; b8: Cell;
    c1: Int; c2: Bool; c3: Int?; c4: Bool?; c5: String; c6: Address; c7: Slice; c8: Cell;
    d1: Int; d2: Bool; d3: Int?; d4: Bool?; d5: String; d6: Address; d7: Slice; d8: Cell;
    e1: Int; e2: Bool; e3: Int?; e4: Bool?; e5: String; e6: Address; e7: Slice; e8: Cell;
    f1: Int; f2: Bool; f3: Int?; f4: Bool?; f5: String; f6: Address; f7: Slice; f8: Cell;
    g1: Int; g2: Bool; g3: Int?; g4: Bool?; g5: String; g6: Address; g7: Slice; g8: Cell;
    init() {
        self.a1=1; self.a2=true; self.a3=null; self.a4=false; self.a5="s"; self.a6=myAddress(); self.a7=emptyCell().asSlice(); self.a8=emptyCell();
        self.b1=2; self.b2=false; self.b3=null; self.b4=true; self.b5="q"; self.b6=myAddress(); self.b7=emptyCell().asSlice(); self.b8=emptyCell();
        self.c1=3; self.c2=true; self.c3=null; self.c4=false; self.c5="r"; self.c6=myAddress(); self.c7=emptyCell().asSlice(); self.c8=emptyCell();
        self.d1=4; self.d2=false; self.d3=null; self.d4=true; self.d5="t"; self.d6=myAddress(); self.d7=emptyCell().asSlice(); self.d8=emptyCell();
        self.e1=5; self.e2=true; self.e3=null; self.e4=false; self.e5="u"; self.e6=myAddress(); self.e7=emptyCell().asSlice(); self.e8=emptyCell();
        self.f1=6; self.f2=false; self.f3=null; self.f4=true; self.f5="v"; self.f6=myAddress(); self.f7=emptyCell().asSlice(); self.f8=emptyCell();
        self.g1=7; self.g2=true; self.g3=null; self.g4=false; self.g5="w"; self.g6=myAddress(); self.g7=emptyCell().asSlice(); self.g8=emptyCell();
    }
}