contract TestContract {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: Bool;
    f8: Bool;
    f9: String;
    f10: String;
    f11: Cell;
    f12: Cell;
    f13: Address;
    f14: Address;
    f15: Slice;
    f16: Slice;
    f17: Int?;
    f18: Bool?;
    f19: String?;
    f20: Cell?;

    init() {
        self.f1 = 1; self.f2 = 2; self.f3 = 3; self.f4 = 4; self.f5 = 5;
        self.f6 = true; self.f7 = false; self.f8 = true;
        self.f9 = "abc"; self.f10 = "def";
        self.f11 = emptyCell(); self.f12 = emptyCell();
        self.f13 = myAddress(); self.f14 = myAddress();
        self.f15 = emptyCell().asSlice(); self.f16 = emptyCell().asSlice();
        self.f17 = null; self.f18 = null; self.f19 = null; self.f20 = null;
    }
}