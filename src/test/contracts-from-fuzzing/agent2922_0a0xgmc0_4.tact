contract ManyFields {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Cell;
    f8: Cell?;
    f9: Slice;
    f10: Slice?;
    f11: Address;
    f12: Address?;

    init() {
        self.f1 = 1;
        self.f2 = null;
        self.f3 = true;
        self.f4 = null;
        self.f5 = "a";
        self.f6 = null;
        self.f7 = emptyCell();
        self.f8 = null;
        self.f9 = emptyCell().asSlice();
        self.f10 = null;
        self.f11 = myAddress();
        self.f12 = null;
    }
}