contract MixedOptionals {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    cellVal: Cell?;
    sliceVal: Slice?;
    addrVal: Address?;

    init() {
        self.intVal = 42;
        self.boolVal = false;
        self.stringVal = null;
        self.cellVal = emptyCell();
        self.sliceVal = null;
        self.addrVal = null;
    }
}