contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Builder;
    f7: Slice;
    f8: Int?;
    f9: Bool;
    f10: String;
    f11: Address;
    f12: Cell;
    f13: Builder;
    f14: Slice;
    f15: Int?;
    f16: Int;
    f17: Bool;
    f18: String;
    f19: Address;
    f20: Cell;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "hi";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = beginCell();
        self.f7 = emptyCell().asSlice();
        self.f8 = null;
        self.f9 = true;
        self.f10 = "bye";
        self.f11 = myAddress();
        self.f12 = emptyCell();
        self.f13 = beginCell();
        self.f14 = emptyCell().asSlice();
        self.f15 = 3;
        self.f16 = 4;
        self.f17 = true;
        self.f18 = "hello";
        self.f19 = myAddress();
        self.f20 = emptyCell();
    }
}