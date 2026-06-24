contract ManyFields {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Address;
    f8: Address?;
    f9: Cell;
    f10: Cell?;
    f11: Slice;
    f12: Slice?;
    f13: Builder;
    f14: Builder?;

    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = true;
        self.f4 = null;
        self.f5 = "x";
        self.f6 = null;
        self.f7 = myAddress();
        self.f8 = null;
        self.f9 = emptyCell();
        self.f10 = null;
        self.f11 = emptyCell().asSlice();
        self.f12 = null;
        self.f13 = beginCell();
        self.f14 = null;
    }
}