contract Test {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
    optionalInt: Int? = null;
    optionalStr: String? = null;
    optionalBool: Bool? = null;
    optionalAddr: Address? = null;
    optionalCell: Cell? = null;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "foo";
    }
}