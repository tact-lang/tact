contract Test {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Address;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "test";
        self.f4 = null;
        self.f5 = true;
        self.f6 = null;
        self.f7 = emptyCell();
        self.f8 = emptyCell().asSlice();
        self.f9 = myAddress();
    }
}