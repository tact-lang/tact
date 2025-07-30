// Many persistent fields with different primitive types
contract StorageTest {
    intv: Int;
    boolv: Bool;
    strv: String;
    addrv: Address;
    cellv: Cell;
    slicev: Slice;

    init() {
        self.intv = 5;
        self.boolv = true;
        self.strv = "hi";
        self.addrv = myAddress();
        self.cellv = emptyCell();
        self.slicev = emptyCell().asSlice();
    }
}