contract LargeDirectFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Slice;
    f6: Cell;
    f7: Bool?;
    f8: String?;
    f9: Int?;
    f10: Address?;
    f11: Slice?;
    f12: Cell?;
    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "abc";
        self.f4 = myAddress();
        self.f5 = emptySlice();
        self.f6 = emptyCell();
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
    }
}