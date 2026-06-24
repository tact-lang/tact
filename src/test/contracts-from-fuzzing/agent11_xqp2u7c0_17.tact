contract LongListPrimitives {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    c1: Cell; c2: Cell; c3: Cell; c4: Cell; c5: Cell;
    sl1: Slice; sl2: Slice; sl3: Slice; sl4: Slice; sl5: Slice;
    adr1: Address; adr2: Address; adr3: Address; adr4: Address; adr5: Address;

    init() {
        self.a1 = 1; self.a2 = 2; self.a3 = 3; self.a4 = 4; self.a5 = 5;
        self.b1 = true; self.b2 = false; self.b3 = true; self.b4 = false; self.b5 = true;
        self.s1 = "a"; self.s2 = "b"; self.s3 = "c"; self.s4 = "d"; self.s5 = "e";
        self.c1 = emptyCell(); self.c2 = emptyCell(); self.c3 = emptyCell(); self.c4 = emptyCell(); self.c5 = emptyCell();
        self.sl1 = emptyCell().asSlice(); self.sl2 = emptyCell().asSlice(); self.sl3 = emptyCell().asSlice(); self.sl4 = emptyCell().asSlice(); self.sl5 = emptyCell().asSlice();
        self.adr1 = myAddress(); self.adr2 = myAddress(); self.adr3 = myAddress(); self.adr4 = myAddress(); self.adr5 = myAddress();
    }
}