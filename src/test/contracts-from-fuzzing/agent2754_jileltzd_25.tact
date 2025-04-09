contract NullablePrimitives {
    intVal: Int?;
    boolVal: Bool?;
    addrVal: Address?;
    sliceVal: Slice?;
    cellVal: Cell?;
    stringVal: String?;

    init() {
        self.intVal = null;
        self.boolVal = null;
        self.addrVal = null;
        self.sliceVal = null;
        self.cellVal = null;
        self.stringVal = null;
    }
}
