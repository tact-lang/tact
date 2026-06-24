contract ManyPrimitiveFields {
    int1: Int;
    bool1: Bool;
    string1: String;
    cell1: Cell;
    slice1: Slice;
    builder1: Builder;
    address1: Address;
    int2: Int;
    bool2: Bool;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.string1 = "hello";
        self.cell1 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.builder1 = beginCell();
        self.address1 = myAddress();
        self.int2 = -1;
        self.bool2 = false;
    }
}