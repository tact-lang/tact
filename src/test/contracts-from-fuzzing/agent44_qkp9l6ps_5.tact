contract LargeFieldList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Slice;
    f5: Cell;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Slice;
    f11: Cell;
    f12: Address;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "a";
        self.f4 = emptySlice();
        self.f5 = emptyCell();
        self.f6 = myAddress();
        self.f7 = 7;
        self.f8 = true;
        self.f9 = "z";
        self.f10 = emptySlice();
        self.f11 = emptyCell();
        self.f12 = myAddress();
    }
}