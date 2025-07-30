contract ComplexOptionals {
    addr: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    strVal: String?;
    boolVal: Bool?;
    intVal: Int?;

    init() {
        self.addr = null;
        self.cellVal = null;
        self.sliceVal = null;
        self.strVal = null;
        self.boolVal = null;
        self.intVal = null;
    }
}
