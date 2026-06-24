contract LotsOfFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: String;
    f5: Slice;
    f6: Cell;
    f7: Address;
    f8: Bool;
    f9: Int;
    f10: String;
    f11: Address;
    f12: Bool;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = false;
        self.f4 = "a";
        self.f5 = emptyCell().asSlice();
        self.f6 = emptyCell();
        self.f7 = myAddress();
        self.f8 = true;
        self.f9 = 9;
        self.f10 = "b";
        self.f11 = myAddress();
        self.f12 = true;
    }
}
