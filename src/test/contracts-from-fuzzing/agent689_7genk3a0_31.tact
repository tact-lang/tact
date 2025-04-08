contract CrossOptional {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    addrVal: Address?;
    sliceVal: Slice?;
    cellVal: Cell?;
    builderVal: Builder?;
    init() {
        self.intVal = null;
        self.boolVal = null;
        self.strVal = null;
        self.addrVal = null;
        self.sliceVal = null;
        self.cellVal = null;
        self.builderVal = null;
    }
}