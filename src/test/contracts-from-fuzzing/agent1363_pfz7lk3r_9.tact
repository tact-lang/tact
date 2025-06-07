contract ManyPersistentFields {
    int1: Int;
    int2: Int;
    int3: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.bool1 = true;
        self.bool2 = false;
        self.bool3 = true;
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
    }
}