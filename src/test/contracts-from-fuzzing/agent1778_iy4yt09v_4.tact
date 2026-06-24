contract MaxFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Builder;
    f8: String;
    f9: Int;
    f10: Bool;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "abc";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = self.f5.asSlice();
        self.f7 = beginCell();
        self.f8 = "def";
        self.f9 = 9;
        self.f10 = false;
    }
}