contract LargeDirectFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    f7: Slice;
    f8: Slice;
    f9: Address;
    f10: Cell;
    f11: Cell;
    f12: Address;
    f13: Bool;
    f14: Int;
    f15: String;
    f16: Int?;
    f17: Bool?;
    f18: String?;
    f19: Slice;
    f20: Address;

    init() {
        self.f1 = 1;
        self.f2 = false;
        self.f3 = "foo";
        self.f4 = null;
        self.f5 = null;
        self.f6 = "bar";
        self.f7 = emptyCell().asSlice();
        self.f8 = emptyCell().asSlice();
        self.f9 = myAddress();
        self.f10 = emptyCell();
        self.f11 = emptyCell();
        self.f12 = myAddress();
        self.f13 = true;
        self.f14 = 2;
        self.f15 = "hello";
        self.f16 = 4;
        self.f17 = false;
        self.f18 = null;
        self.f19 = emptyCell().asSlice();
        self.f20 = myAddress();
    }
}