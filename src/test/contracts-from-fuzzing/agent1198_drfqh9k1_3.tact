contract TestContract {
    intVal: Int;
    boolVal: Bool;
    addressVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    stringVal: String;

    init() {
        self.intVal = 100;
        self.boolVal = false;
        self.addressVal = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.stringVal = "initialized";
    }

    receive() {
        self.intVal = 7;
    }
}