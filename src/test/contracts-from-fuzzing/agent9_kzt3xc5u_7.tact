contract LargeContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Cell;
    f11: Slice;
    f12: Address;
    f13: Int;
    f14: Bool;
    f15: String;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "a";
        self.f4 = emptyCell();
        self.f5 = emptyCell().asSlice();
        self.f6 = myAddress();
        self.f7 = 7;
        self.f8 = true;
        self.f9 = "b";
        self.f10 = emptyCell();
        self.f11 = emptyCell().asSlice();
        self.f12 = myAddress();
        self.f13 = 13;
        self.f14 = false;
        self.f15 = "c";
    }
}