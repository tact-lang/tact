contract LotsOfFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Bool;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: String;
    f9: String?;
    f10: Bool;
    f11: Bool?;
    f12: Cell;
    f13: Cell;
    f14: Slice;
    f15: Slice;
    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = true;
        self.f5 = myAddress();
        self.f6 = null;
        self.f7 = null;
        self.f8 = "abc";
        self.f9 = null;
        self.f10 = false;
        self.f11 = null;
        self.f12 = emptyCell();
        self.f13 = emptyCell();
        self.f14 = emptyCell().asSlice();
        self.f15 = emptyCell().asSlice();
    }
}