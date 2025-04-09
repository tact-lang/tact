contract BarePrimitives {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;

    init() {
        self.intVal = 42;
        self.boolVal = true;
        self.strVal = "hello";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
    }
}