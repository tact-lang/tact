contract MixTypes {
    valInt: Int = 0;
    valBool: Bool = false;
    valAddr: Address;
    valSlice: Slice;
    valCell: Cell;
    valOpt: String? = null;

    init() {
        self.valInt = 10;
        self.valBool = true;
        self.valAddr = myAddress();
        self.valSlice = emptyCell().asSlice();
        self.valCell = emptyCell();
        self.valOpt = "hi";
    }
}