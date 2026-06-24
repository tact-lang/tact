contract MixMany {
    int1: Int;
    bool1: Bool;
    str1: String;
    addr1: Address;
    optInt: Int?;
    optStr: String?;
    cell1: Cell;
    slice1: Slice;
    builder1: Builder;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.str1 = "hi";
        self.addr1 = myAddress();
        self.optInt = null;
        self.optStr = "world";
        self.cell1 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.builder1 = beginCell();
    }
}