contract ManyMixedPrims {
    int1: Int;
    int2: Int as uint8;
    int3: Int as int16;
    bool1: Bool;
    bool2: Bool;
    addr1: Address;
    addr2: Address;
    str1: String;
    str2: String;
    cell1: Cell;
    cell2: Cell;

    init() {
        self.int1 = 1;
        self.int2 = 255;
        self.int3 = -32768;
        self.bool1 = true;
        self.bool2 = false;
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.str1 = "foo";
        self.str2 = "bar";
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
    }
}