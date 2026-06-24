contract PrimitivesAndOptionalFields {
    intVal: Int;
    optionalInt: Int?;
    boolVal: Bool;
    optionalBool: Bool?;
    stringVal: String;
    optionalString: String?;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;

    init() {
        self.intVal = 1;
        self.optionalInt = null;
        self.boolVal = true;
        self.optionalBool = null;
        self.stringVal = "hi";
        self.optionalString = null;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.addressVal = myAddress();
    }
}