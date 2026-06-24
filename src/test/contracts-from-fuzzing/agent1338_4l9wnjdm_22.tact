contract OptionalManyPrimitives {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    cellVal: Cell?;
    sliceVal: Slice?;
    addressVal: Address?;

    init() {
        self.intVal = null;
        self.boolVal = null;
        self.stringVal = null;
        self.cellVal = null;
        self.sliceVal = null;
        self.addressVal = null;
    }
}