contract ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Bool;
    f6: Bool;
    f7: String;
    f8: String;
    f9: Int?;
    f10: Bool?;
    f11: String?;
    f12: Address;
    f13: Cell;
    f14: Slice;
    f15: Builder;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = 3;
        self.f4 = 4;
        self.f5 = true;
        self.f6 = false;
        self.f7 = "one";
        self.f8 = "two";
        self.f9 = 9;
        self.f10 = null;
        self.f11 = null;
        self.f12 = myAddress();
        self.f13 = emptyCell();
        self.f14 = emptyCell().asSlice();
        self.f15 = beginCell();
    }
}