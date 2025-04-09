contract LargeFlatStorage {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: String;
    f6: String;
    f7: Cell;
    f8: Slice;
    f9: Address;
    f10: Address;

    init() {
        self.f1 = 1;
        self.f2 = 2;
        self.f3 = true;
        self.f4 = false;
        self.f5 = "A";
        self.f6 = "B";
        self.f7 = emptyCell();
        self.f8 = emptyCell().asSlice();
        self.f9 = myAddress();
        self.f10 = myAddress();
    }
}