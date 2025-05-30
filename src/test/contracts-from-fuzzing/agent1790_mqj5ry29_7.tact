contract MixedTypes {
    valInt: Int;
    valBool: Bool;
    valAddr: Address;
    valCell: Cell;
    valSlice: Slice;
    valStr: String;
    valOptInt: Int?;
    valOptBool: Bool?;
    valOptAddress: Address?;
    valOptCell: Cell?;

    init() {
        self.valInt = 1;
        self.valBool = false;
        self.valAddr = myAddress();
        self.valCell = emptyCell();
        self.valSlice = emptyCell().asSlice();
        self.valStr = "";
        self.valOptInt = null;
        self.valOptBool = null;
        self.valOptAddress = null;
        self.valOptCell = null;
    }
}
