contract WideFieldsTest {
    intVal: Int = 123;
    boolVal: Bool = true;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String = "abc";

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
    }

    receive() {
        let _ = self.intVal + 1;
    }
}