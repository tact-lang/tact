contract ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Builder;
    f7: Slice;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "x";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = beginCell();
        self.f7 = emptyCell().asSlice();
    }
}