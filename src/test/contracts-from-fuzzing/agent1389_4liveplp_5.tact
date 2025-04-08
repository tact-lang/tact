contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Cell;
    f12: Slice;
    f13: Builder;
    f14: Address;
    f15: Int;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "a";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = beginCell();
        self.f7 = myAddress();
        self.f8 = 8;
        self.f9 = true;
        self.f10 = "b";
        self.f11 = emptyCell();
        self.f12 = emptyCell().asSlice();
        self.f13 = beginCell();
        self.f14 = myAddress();
        self.f15 = 15;
    }
}