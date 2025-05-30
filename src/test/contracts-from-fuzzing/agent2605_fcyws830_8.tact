contract WideVariety {
    i1: Int;
    b1: Bool;
    s1: String;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    cell1: Cell;
    slice1: Slice;
    addr1: Address;

    init() {
        self.i1 = 42;
        self.b1 = true;
        self.s1 = "hello";
        self.optI = null;
        self.optB = false;
        self.optS = null;
        self.cell1 = emptyCell();
        self.slice1 = self.cell1.asSlice();
        self.addr1 = myAddress();
    }
}
