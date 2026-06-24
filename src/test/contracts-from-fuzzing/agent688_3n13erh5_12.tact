contract TestContract {
    intVal: Int = 10;
    boolVal: Bool = true;
    strVal: String = "abc";
    addrVal: Address;
    cellVal: Cell;

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
    }
}