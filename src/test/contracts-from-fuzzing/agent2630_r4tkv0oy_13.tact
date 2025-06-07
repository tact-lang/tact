contract LongList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Address;
    f11: Cell;
    f12: Slice;
    f13: Int;
    f14: Bool;
    f15: String;
    f16: Address;
    f17: Cell;
    f18: Slice;
    f19: Int;
    f20: Bool;

    init() {
        self.f1 = 1; self.f2 = true; self.f3 = "a"; self.f4 = myAddress(); self.f5 = emptyCell(); self.f6 = emptyCell().asSlice();
        self.f7 = 2; self.f8 = false; self.f9 = "b"; self.f10 = myAddress(); self.f11 = emptyCell(); self.f12 = emptyCell().asSlice();
        self.f13 = 3; self.f14 = true; self.f15 = "c"; self.f16 = myAddress(); self.f17 = emptyCell(); self.f18 = emptyCell().asSlice();
        self.f19 = 4; self.f20 = false;
    }
}