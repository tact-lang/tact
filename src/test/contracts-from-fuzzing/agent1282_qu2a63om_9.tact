struct Middle {
    x: Int;
    y: Int;
}

contract MultFieldTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    addrField: Address;
    sliceField: Slice;
    cellField: Cell;
    middleField: Middle;

    init() {
        self.intField = 5;
        self.boolField = true;
        self.strField = "str";
        self.addrField = myAddress();
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.middleField = Middle{x: 1, y: 2};
    }
}
