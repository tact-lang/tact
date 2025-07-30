contract ManyPrimitiveFields {
    int1: Int;
    bool1: Bool;
    string1: String;
    addr1: Address;
    cell1: Cell;
    slice1: Slice;
    builder1: Builder;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.string1 = "test";
        self.addr1 = myAddress();
        self.cell1 = emptyCell();
        self.slice1 = self.cell1.asSlice();
        self.builder1 = beginCell();
    }
}