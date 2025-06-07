contract LotsOfFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Slice;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Address;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hi";
        self.f4 = emptyCell();
        self.f5 = myAddress();
        self.f6 = emptyCell().asSlice();
        self.f7 = 7;
        self.f8 = false;
        self.f9 = "bye";
        self.f10 = myAddress();
    }
}