contract LongList {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Cell;
    f05: Slice;
    f06: Builder;
    f07: Address;
    f08: Int?;
    f09: Bool?;
    f10: String?;
    f11: Cell?;
    f12: Slice?;
    f13: Builder?;
    f14: Address?;

    init() {
        self.f01 = 1;
        self.f02 = false;
        self.f03 = "";
        self.f04 = emptyCell();
        self.f05 = emptyCell().asSlice();
        self.f06 = beginCell();
        self.f07 = myAddress();
        self.f08 = null;
        self.f09 = true;
        self.f10 = null;
        self.f11 = null;
        self.f12 = null;
        self.f13 = null;
        self.f14 = null;
    }
}
