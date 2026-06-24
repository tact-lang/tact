contract BigMixedPersistentVars {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Address;
    f5: Slice;
    f6: Cell;
    f7: Int?;
    f8: String?;
    f9: Bool?;
    f10: Address?;
    f11: Slice?;
    f12: Cell?;

    init() {
        self.f1 = 1;
        self.f2 = "a";
        self.f3 = true;
        self.f4 = myAddress();
        self.f5 = emptyCell().asSlice();
        self.f6 = emptyCell();
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
    }
}