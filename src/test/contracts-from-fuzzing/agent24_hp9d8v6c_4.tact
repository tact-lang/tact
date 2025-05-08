contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Int?;
    f7: Bool?;
    f8: String;
    f9: Address;
    f10: Int;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "alpha";
        self.f4 = emptyCell();
        self.f5 = self.f4.asSlice();
        self.f6 = null;
        self.f7 = null;
        self.f8 = "beta";
        self.f9 = myAddress();
        self.f10 = 999;
    }
}