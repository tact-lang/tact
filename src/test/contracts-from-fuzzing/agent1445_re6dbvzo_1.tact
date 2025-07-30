contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: Bool;
    f9: Int;
    f10: String;
    f11: Int = 42;
    f12: Bool = false;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "abc";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = beginCell();
        self.f8 = false;
        self.f9 = 9;
        self.f10 = "xyz";
    }
}