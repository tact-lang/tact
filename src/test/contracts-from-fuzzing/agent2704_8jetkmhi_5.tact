contract ManyPrimitiveFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String;
    f7: Int;
    f8: Bool;
    f9: Address;
    f10: Cell;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = myAddress();
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = "test";
        self.f7 = -5;
        self.f8 = true;
        self.f9 = myAddress();
        self.f10 = emptyCell();
    }
}