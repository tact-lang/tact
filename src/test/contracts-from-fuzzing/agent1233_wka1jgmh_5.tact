// Remove problematic default values
contract MultiPrimitivesNoDefault {
    intField: Int = 1;
    boolField: Bool = true;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String = "hello";

    init() {
        self.intField = 42;
        self.addrField = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        self.cellField = emptyCell();
        self.sliceField = emptyCell().asSlice();
    }
}