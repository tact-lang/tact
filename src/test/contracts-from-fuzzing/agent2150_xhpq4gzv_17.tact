// Contract with very long list of persistent fields with mixed types
contract TestContract {
    a0: Int; a1: Int?;
    a2: Bool; a3: Bool?;
    a4: String; a5: String?;
    a6: Cell; a7: Cell?;
    a8: Slice; a9: Slice?;
    a10: Builder; a11: Builder?;
    a12: Address; a13: Address?;
    b0: Int; b1: Int?;
    b2: Bool; b3: Bool?;
    b4: String; b5: String?;
    b6: Cell; b7: Cell?;
    b8: Slice; b9: Slice?;
    b10: Builder; b11: Builder?;
    b12: Address; b13: Address?;

    init() {
        self.a0=1; self.a1=null;
        self.a2=true; self.a3=null;
        self.a4="a4"; self.a5=null;
        self.a6=emptyCell(); self.a7=null;
        self.a8=emptyCell().asSlice(); self.a9=null;
        self.a10=beginCell(); self.a11=null;
        self.a12=myAddress(); self.a13=null;
        self.b0=2; self.b1=null;
        self.b2=false; self.b3=null;
        self.b4="b4"; self.b5=null;
        self.b6=emptyCell(); self.b7=null;
        self.b8=emptyCell().asSlice(); self.b9=null;
        self.b10=beginCell(); self.b11=null;
        self.b12=myAddress(); self.b13=null;
    }
}