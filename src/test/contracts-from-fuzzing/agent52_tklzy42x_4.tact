contract LargePrimitiveFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;

    init() {
        self.f1 = 0;
        self.f2 = false;
        self.f3 = "";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = beginCell();
        self.f7 = myAddress();
    }
}