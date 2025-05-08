contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int?;
    f8: Bool?;
    f9: String?;
    f10: Cell?;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Cell;
    f15: Slice;
    f16: Address;
    f17: Int?;
    f18: Bool?;
    f19: String?;
    f20: Cell?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hi";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = myAddress();
        self.f7 = null;
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = 11;
        self.f12 = false;
        self.f13 = "hello";
        self.f14 = emptyCell();
        self.f15 = emptyCell().asSlice();
        self.f16 = myAddress();
        self.f17 = null;
        self.f18 = null;
        self.f19 = null;
        self.f20 = null;
    }
}