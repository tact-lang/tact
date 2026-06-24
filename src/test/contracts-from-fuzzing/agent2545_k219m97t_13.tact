contract LargeNumberOfFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Address;
    f5: String;
    f6: Cell;
    f7: Slice;
    f8: Builder;
    f9: Bool?;
    f10: Address?;
    f11: String?;
    f12: Cell?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = null;
        self.f4 = myAddress();
        self.f5 = "abc";
        self.f6 = emptyCell();
        self.f7 = self.f6.asSlice();
        self.f8 = beginCell();
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
    }
}
