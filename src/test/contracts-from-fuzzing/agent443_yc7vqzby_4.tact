contract ManyTypes {
    intVal: Int = 1;
    boolVal: Bool = true;
    strVal: String = "test";
    addrVal: Address;
    cellVal: Cell;

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
    }
}
