contract LargeFlat {
    a0: Int; a1: Int; a2: Int; a3: Int; a4: Int;
    a5: Int; a6: Int; a7: Int; a8: Int; a9: Int;
    b0: Bool; b1: Bool; b2: Bool; b3: Bool; b4: Bool;
    c0: String; c1: String; c2: String;
    d0: Cell; d1: Cell;
    e0: Address; e1: Address;

    init() {
        self.a0=0; self.a1=1; self.a2=2; self.a3=3; self.a4=4;
        self.a5=5; self.a6=6; self.a7=7; self.a8=8; self.a9=9;
        self.b0=false; self.b1=true; self.b2=false; self.b3=true; self.b4=false;
        self.c0="zero"; self.c1="one"; self.c2="two";
        self.d0=emptyCell(); self.d1=emptyCell();
        self.e0=myAddress(); self.e1=myAddress();
    }
}