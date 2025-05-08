contract OptionalComplex {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    sliceVal: Slice?;
    addressVal: Address?;

    init() {
        self.intVal = null;
        self.boolVal = null;
        self.strVal = null;
        self.sliceVal = null;
        self.addressVal = null;
    }
}