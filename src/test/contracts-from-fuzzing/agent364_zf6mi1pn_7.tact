contract ManyFields {
    f01: Int;
    f02: Bool;
    f03: Int?;
    f04: String;
    f05: Address;
    f06: Cell;
    f07: Slice;
    f08: Bool;
    f09: Int;
    f10: String;
    f11: Int?;
    f12: Address;
    f13: Int;
    f14: String;
    f15: Cell;
    f16: Slice;
    f17: Bool;
    f18: Int;
    f19: Address;
    f20: String;

    init() {
        self.f01 = 1;
        self.f02 = false;
        self.f03 = null;
        self.f04 = "foo";
        self.f05 = myAddress();
        self.f06 = emptyCell();
        self.f07 = emptyCell().asSlice();
        self.f08 = true;
        self.f09 = 9;
        self.f10 = "bar";
        self.f11 = null;
        self.f12 = myAddress();
        self.f13 = 13;
        self.f14 = "baz";
        self.f15 = emptyCell();
        self.f16 = emptyCell().asSlice();
        self.f17 = true;
        self.f18 = 18;
        self.f19 = myAddress();
        self.f20 = "end";
    }
}