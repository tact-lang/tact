contract ManyTypes {
    intVal: Int = 1;
    boolVal: Bool = true;
    strVal: String = "abc";
    cellVal: Cell;
    addrVal: Address;

    init() {
        self.intVal = 42;
        self.boolVal = false;
        self.strVal = "def";
        self.cellVal = emptyCell();
        self.addrVal = myAddress();
    }
}