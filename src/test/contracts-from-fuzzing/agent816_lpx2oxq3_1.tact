contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: Int as uint8;
    f6: String;
    f7: Cell;
    f8: Slice;
    f9: Builder;
    f10: Address;

    init() {
        self.f1 = 0;
        self.f2 = false;
        self.f3 = null;
        self.f4 = null;
        self.f5 = 0;
        self.f6 = "";
        self.f7 = emptyCell();
        self.f8 = emptyCell().asSlice();
        self.f9 = beginCell();
        self.f10 = myAddress();
    }
}
