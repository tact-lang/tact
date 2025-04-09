contract ManyPrimitives {
    int1: Int = 1;
    int2: Int = 2;
    int3: Int = 3;
    int4: Int = 4;
    int5: Int = 5;
    bool1: Bool = true;
    bool2: Bool = false;
    str1: String = "s1";
    str2: String = "s2";
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;

    init() {
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.cell1 = emptyCell();
        self.cell2 = emptyCell();
    }
}