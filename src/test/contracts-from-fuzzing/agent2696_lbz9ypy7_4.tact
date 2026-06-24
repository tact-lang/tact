contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Slice;
    f7: Builder;
    f8: Int?;
    f9: Bool?;
    f10: String?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "abc";
        self.f4 = emptyCell();
        self.f5 = myAddress();
        self.f6 = self.f4.asSlice();
        self.f7 = beginCell();
        self.f8 = 42;
        self.f9 = false;
        self.f10 = "zzz";
    }
}