contract LargeFlat {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Slice;
    f6: Cell;
    f7: Int;
    f8: Bool;
    f9: Address;
    f10: String;
    f11: Slice;
    f12: Cell;
    f13: Int;
    f14: Bool;
    f15: Address;
    f16: String;
    f17: Slice;
    f18: Cell;
    f19: Int;
    f20: Bool;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = "a";
        self.f5 = emptyCell().asSlice();
        self.f6 = emptyCell();
        self.f7 = 7;
        self.f8 = false;
        self.f9 = myAddress();
        self.f10 = "b";
        self.f11 = emptyCell().asSlice();
        self.f12 = emptyCell();
        self.f13 = 13;
        self.f14 = true;
        self.f15 = myAddress();
        self.f16 = "c";
        self.f17 = emptyCell().asSlice();
        self.f18 = emptyCell();
        self.f19 = 19;
        self.f20 = false;
    }
}