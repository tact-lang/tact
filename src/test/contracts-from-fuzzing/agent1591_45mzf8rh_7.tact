contract LongFieldList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Address;
    f5: Bool;
    f6: Int;
    f7: String;
    f8: Address;
    f9: Cell;
    f10: Bool;
    f11: Int;
    f12: String;
    f13: Address;
    f14: Slice;
    f15: Cell;
    f16: Bool;
    f17: Int;
    f18: String;
    f19: Address;
    f20: Slice;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "a";
        self.f4 = myAddress();
        self.f5 = false;
        self.f6 = 2;
        self.f7 = "b";
        self.f8 = myAddress();
        self.f9 = emptyCell();
        self.f10 = true;
        self.f11 = 3;
        self.f12 = "c";
        self.f13 = myAddress();
        self.f14 = emptyCell().asSlice();
        self.f15 = emptyCell();
        self.f16 = false;
        self.f17 = 4;
        self.f18 = "d";
        self.f19 = myAddress();
        self.f20 = emptyCell().asSlice();
    }
}