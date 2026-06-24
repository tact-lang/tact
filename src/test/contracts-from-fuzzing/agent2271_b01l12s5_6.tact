contract LargePrimitives {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    flag1: Bool;
    flag2: Bool;
    flag3: Bool;
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.flag1 = true;
        self.flag2 = false;
        self.flag3 = true;
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
    }
}