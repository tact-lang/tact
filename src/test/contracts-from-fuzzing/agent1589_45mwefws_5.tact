contract ManyFields {
    int1: Int;
    int2: Int;
    bool1: Bool;
    addr1: Address;
    string1: String;
    cell1: Cell;
    slice1: Slice;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = true;
        self.addr1 = myAddress();
        self.string1 = "Test";
        self.cell1 = emptyCell();
        self.slice1 = self.cell1.asSlice();
    }
}