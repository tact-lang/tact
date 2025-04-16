contract MixPrimitiveFields {
    valInt: Int;
    valBool: Bool;
    valCell: Cell;
    valSlice: Slice;
    valStr: String;
    valAddr: Address;

    init() {
        self.valInt = 1;
        self.valBool = true;
        self.valCell = emptyCell();
        self.valSlice = emptyCell().asSlice();
        self.valStr = "test";
        self.valAddr = myAddress();
    }
}