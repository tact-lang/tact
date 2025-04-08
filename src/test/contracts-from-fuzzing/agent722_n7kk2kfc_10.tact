contract MixedOptionals {
    intVal: Int?;
    boolVal: Bool?;
    addressVal: Address?;
    stringVal: String?;
    cellVal: Cell?;
    sliceVal: Slice?;
    builderVal: Builder?;

    init() {
        self.intVal = 5;
        self.boolVal = null;
        self.addressVal = myAddress();
        self.stringVal = null;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}