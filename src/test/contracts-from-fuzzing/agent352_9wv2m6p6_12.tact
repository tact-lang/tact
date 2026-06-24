contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Int;
    f5: Bool;
    f6: String;
    f7: Cell;
    f8: Address;
    f9: Slice;
    f10: Builder;
    f11: String;
    f12: Bool;
    f13: Slice;
    f14: Int;
    f15: Address;
    f16: Bool;
    f17: Cell;
    f18: Int;
    f19: String;
    f20: Bool;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = false;
        self.f6 = "hi";
        self.f7 = emptyCell();
        self.f8 = myAddress();
        self.f9 = emptyCell().asSlice();
        self.f10 = beginCell();
        self.f11 = "world";
        self.f12 = true;
        self.f13 = emptyCell().asSlice();
        self.f14 = 14;
        self.f15 = myAddress();
        self.f16 = false;
        self.f17 = emptyCell();
        self.f18 = 18;
        self.f19 = "foo";
        self.f20 = true;
    }
}