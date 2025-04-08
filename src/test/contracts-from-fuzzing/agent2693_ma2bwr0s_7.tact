contract FlatManyFields {
    f01: Int;
    f02: Bool;
    f03: Address;
    f04: Cell;
    f05: Slice;
    f06: String;
    f07: Int?;
    f08: Bool?;
    f09: Address?;
    f10: Cell?;
    f11: Slice?;
    f12: String?;

    init() {
        self.f01 = 1;
        self.f02 = true;
        self.f03 = myAddress();
        self.f04 = emptyCell();
        self.f05 = emptyCell().asSlice();
        self.f06 = "hi";
        self.f07 = null;
        self.f08 = null;
        self.f09 = null;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
    }
}
