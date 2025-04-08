contract MixedPrimitivesTest {
    intval: Int;
    boolval: Bool;
    addrval: Address;
    cellval: Cell;
    sliceval: Slice;
    strval: String;

    init() {
        self.intval = 1;
        self.boolval = true;
        self.addrval = myAddress();
        self.cellval = emptyCell();
        self.sliceval = emptyCell().asSlice();
        self.strval = "hi";
    }
}