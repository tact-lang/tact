contract LargeContract {
    f01: Int;
    f02: Bool;
    f03: String;
    f04: Cell;
    f05: Slice;
    f06: Int?;
    f07: Bool?;
    f08: String?;
    f09: Cell?;
    f10: Slice?;
    f11: Address;
    f12: Address?;

    init() {
        self.f01 = 0;
        self.f02 = false;
        self.f03 = "";
        self.f04 = emptyCell();
        self.f05 = emptyCell().asSlice();
        self.f06 = null;
        self.f07 = null;
        self.f08 = null;
        self.f09 = null;
        self.f10 = null;
        self.f11 = myAddress();
        self.f12 = null;
    }
}