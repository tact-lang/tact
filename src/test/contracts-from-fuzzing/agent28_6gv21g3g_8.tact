contract WideTypesTest {
    intVar: Int;
    boolVar: Bool;
    addrVar: Address;
    cellVar: Cell;
    sliceVar: Slice;
    stringVar: String;

    init() {
        self.intVar = 0;
        self.boolVar = false;
        self.addrVar = myAddress();
        self.cellVar = emptyCell();
        self.sliceVar = emptyCell().asSlice();
        self.stringVar = "test";
    }
}