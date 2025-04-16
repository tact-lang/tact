contract TestContract {
    intVal: Int = -1;
    boolVal: Bool = true;
    stringVal: String = "test";
    cellVal: Cell;
    addressVal: Address;

    init() {
        self.cellVal = emptyCell();
        self.addressVal = myAddress();
    }
}
