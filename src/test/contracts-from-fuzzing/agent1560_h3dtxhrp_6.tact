contract TestContract {
    intVal: Int = 5;
    boolVal: Bool = true;
    addrVal: Address; // no default
    cellVal: Cell; // no default
    strVal: String = "hello";

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
    }
}