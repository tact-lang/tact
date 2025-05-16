contract LongStorage {
    int1: Int = 1;
    int2: Int = 2;
    int3: Int = 3;
    int4: Int = 4;
    bool1: Bool = true;
    bool2: Bool = false;
    boolOpt: Bool?;
    str1: String = "a";
    str2: String = "b";
    strOpt: String?;
    slc1: Slice;
    slcOpt: Slice?;
    cell1: Cell;
    cellOpt: Cell?;
    addr1: Address;
    addrOpt: Address?;

    init() {
        self.boolOpt = null;
        self.strOpt = null;
        self.slc1 = emptyCell().asSlice();
        self.slcOpt = null;
        self.cell1 = emptyCell();
        self.cellOpt = null;
        self.addr1 = contractAddress(initOf LongStorage());
        self.addrOpt = null;
    }
}
