contract PrimitiveTypes {
    intVal: Int = 7;
    boolVal: Bool = false;
    strVal: String = "abc";
    addrVal: Address;
    cellVal: Cell;

    init() {
        self.addrVal = myAddress();
        self.cellVal = emptyCell();
    }
}
