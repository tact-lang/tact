contract ManyFields {
    f1: Int = 1;
    f2: Bool = true;
    f3: Address;
    f4: Cell;
    f5: Slice;
    f6: String = "a";
    f7: Int = 2;
    f8: Bool = false;
    f9: Address;
    f10: Cell;
    f11: Slice;
    f12: String = "b";

    init() {
        self.f3 = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f9 = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        self.f10 = emptyCell();
        self.f11 = emptyCell().asSlice();
    }
}