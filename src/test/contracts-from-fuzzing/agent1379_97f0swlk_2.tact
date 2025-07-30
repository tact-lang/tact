contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
    f8: Int?;
    f9: Bool?;
    f10: String?;
    f11: Cell?;
    f12: Slice?;
    f13: Builder?;
    f14: Address?;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "str";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = beginCell();
        self.f7 = myAddress();
        self.f8 = 2;
        self.f9 = false;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
        self.f13 = null;
        self.f14 = null;
    }
}
