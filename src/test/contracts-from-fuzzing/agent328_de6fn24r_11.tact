contract BigFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Cell;
    f6: Slice;
    f7: String;
    f8: Address;
    f9: Int;
    f10: Bool;
    f11: Int?;
    f12: Bool?;
    f13: Cell;
    f14: Slice;
    f15: String;
    f16: Address;
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = false;
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = "yo";
        self.f8 = myAddress();
        self.f9 = 2;
        self.f10 = false;
        self.f11 = null;
        self.f12 = true;
        self.f13 = emptyCell();
        self.f14 = emptyCell().asSlice();
        self.f15 = "hi";
        self.f16 = myAddress();
    }
}