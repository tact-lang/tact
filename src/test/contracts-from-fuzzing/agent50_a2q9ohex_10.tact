contract ManyPersistentFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Int?;
    f9: Bool?;
    f10: Address?;
    f11: String?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = myAddress();
        self.f4 = "foo";
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = beginCell();
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
        self.f11 = null;
    }
}