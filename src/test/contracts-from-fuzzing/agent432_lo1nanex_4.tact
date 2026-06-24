contract TestContract {
    intVal: Int = 0;
    boolVal: Bool = false;
    stringVal: String = "";
    sliceVal: Slice;
    cellVal: Cell;
    addressVal: Address;

    init() {
        self.intVal = 123;
        self.boolVal = true;
        self.stringVal = "hello";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.addressVal = contractAddress(initOf TestContract());
    }
}
