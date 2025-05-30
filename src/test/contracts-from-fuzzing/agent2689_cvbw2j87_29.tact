contract OptionalPrimitiveEdge {
    intVal: Int?;
    boolVal: Bool?;
    strVal: String?;
    sliceVal: Slice?;
    cellVal: Cell?;

    init() {
        self.intVal = null;
        self.boolVal = null;
        self.strVal = null;
        self.sliceVal = null;
        self.cellVal = null;
    }
}