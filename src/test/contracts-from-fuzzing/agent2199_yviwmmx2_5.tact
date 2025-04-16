contract LongContract {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int;
    f5: Bool;
    f6: Slice;
    f7: Cell;
    f8: String;
    f9: Address;
    f10: Int;
    f11: Bool;
    f12: String;
    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = myAddress();
        self.f4 = 4;
        self.f5 = true;
        self.f6 = emptyCell().asSlice();
        self.f7 = emptyCell();
        self.f8 = "test";
        self.f9 = myAddress();
        self.f10 = 10;
        self.f11 = false;
        self.f12 = "foo";
    }
}
