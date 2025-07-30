contract LotsOfFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Cell;
    f6: Slice;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Int?;
    f11: Bool?;
    f12: String?;
    f13: Cell;
    f14: Slice;
    f15: Address;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = emptyCell();
        self.f6 = emptyCell().asSlice();
        self.f7 = false;
        self.f8 = 42;
        self.f9 = "b";
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
        self.f13 = emptyCell();
        self.f14 = emptyCell().asSlice();
        self.f15 = myAddress();
    }

    receive() {
        self.f1 = self.f1 + 1;
    }
}
