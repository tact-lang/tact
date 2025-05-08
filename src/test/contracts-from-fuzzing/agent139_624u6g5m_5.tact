contract LotsOfPrimitiveFields {
    f1: Int;
    f2: String;
    f3: Bool;
    f4: Int?;
    f5: Address;
    f6: Cell;
    f7: Slice;
    f8: Bool?;
    f9: Address?;
    f10: String?;

    init() {
        self.f1 = 1;
        self.f2 = "hi";
        self.f3 = true;
        self.f4 = 2;
        self.f5 = myAddress();
        self.f6 = emptyCell();
        self.f7 = emptyCell().asSlice();
        self.f8 = null;
        self.f9 = null;
        self.f10 = null;
    }
}