contract OptionalPrimitives {
    intVal: Int?;
    boolVal: Bool?;
    stringVal: String?;
    cellVal: Cell?;
    addressVal: Address?;

    init() {
        self.intVal = null;
        self.boolVal = null;
        self.stringVal = null;
        self.cellVal = null;
        self.addressVal = null;
    }
}