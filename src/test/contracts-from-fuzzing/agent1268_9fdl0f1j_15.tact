contract LotsOfPrimitiveFields {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Int?;
    x5: Bool?;
    x6: String?;
    x7: Cell;
    x8: Slice;
    x9: Address;
    x10: Cell?;
    x11: Slice?;
    x12: Address?;

    init() {
        self.x1 = 1;
        self.x2 = true;
        self.x3 = "str";
        self.x4 = null;
        self.x5 = false;
        self.x6 = null;
        self.x7 = emptyCell();
        self.x8 = emptyCell().asSlice();
        self.x9 = myAddress();
        self.x10 = null;
        self.x11 = null;
        self.x12 = null;
    }
}