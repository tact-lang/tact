struct SubStruct {
    b: Bool;
    s: String;
}

contract MixTypeFields {
    intField: Int;
    boolField: Bool;
    stringField: String;
    addrField: Address;
    sliceField: Slice;
    cellField: Cell;
    nested: SubStruct;

    init() {
        self.intField = 123;
        self.boolField = false;
        self.stringField = "abc";
        self.addrField = myAddress();
        self.sliceField = emptyCell().asSlice();
        self.cellField = emptyCell();
        self.nested = SubStruct{b: true, s: "nested"};
    }
}
