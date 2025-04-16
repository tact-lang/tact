contract ManyPrimitives {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Builder;
    f7: Slice;
    f8: Int?;
    f9: Bool?;
    f10: String?;
    f11: Address?;
    f12: Cell?;
    f13: Builder?;
    f14: Slice?;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "abc";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = beginCell();
        self.f7 = emptyCell().asSlice();

        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
        self.f13 = null;
        self.f14 = null;
    }
}
