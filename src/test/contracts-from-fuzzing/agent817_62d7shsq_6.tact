contract LargePrimitiveList {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int; f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool; b6: Bool; b7: Bool; b8: Bool; b9: Bool; b10: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    c1: Cell; c2: Cell; c3: Cell;

    init() {
        self.f1 = 1; self.f2 = 2; self.f3 = 3; self.f4 = 4; self.f5 = 5;
        self.f6 = 6; self.f7 = 7; self.f8 = 8; self.f9 = 9; self.f10 = 10;
        self.b1 = true; self.b2 = false; self.b3 = true; self.b4 = false; self.b5 = true;
        self.b6 = false; self.b7 = true; self.b8 = false; self.b9 = true; self.b10 = false;
        self.s1 = "a"; self.s2 = "b"; self.s3 = "c"; self.s4 = "d"; self.s5 = "e";
        self.c1 = emptyCell(); self.c2 = emptyCell(); self.c3 = emptyCell();
    }
}