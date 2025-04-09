contract BigMix {
    addr1: Address;
    addr2: Address?;
    str1: String;
    str2: String?;
    cell1: Cell;
    cell2: Cell?;
    slice1: Slice;
    slice2: Slice?;
    bool1: Bool;
    bool2: Bool?;
    num: Int;
    numOpt: Int?;

    init() {
        self.addr1 = myAddress();
        self.addr2 = null;
        self.str1 = "hi";
        self.str2 = null;
        self.cell1 = emptyCell();
        self.cell2 = null;
        self.slice1 = emptyCell().asSlice();
        self.slice2 = null;
        self.bool1 = true;
        self.bool2 = null;
        self.num = 42;
        self.numOpt = null;
    }
}