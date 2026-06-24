contract LotsOfFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Bool?;
    f8: Int?;
    f9: String;
    f10: Int;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "test";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = null;
        self.f8 = 42;
        self.f9 = "another";
        self.f10 = 100;
    }
}