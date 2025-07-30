contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int;
    f9: Bool;
    f10: String;
    f11: Address;
    f12: Cell;
    f13: Slice;
    f14: Builder;
    f15: String;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = beginCell();
        self.f8 = 2;
        self.f9 = false;
        self.f10 = "b";
        self.f11 = myAddress();
        self.f12 = emptyCell();
        self.f13 = emptyCell().asSlice();
        self.f14 = beginCell();
        self.f15 = "c";
    }
}