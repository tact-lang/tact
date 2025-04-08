contract ManyPrimitiveTypes {
    varInt: Int;
    varBool: Bool;
    varCell: Cell;
    varSlice: Slice;
    varAddr: Address;
    varStr: String;

    init() {
        self.varInt = 1;
        self.varBool = true;
        self.varCell = emptyCell();
        self.varSlice = self.varCell.asSlice();
        self.varAddr = myAddress();
        self.varStr = "test";
    }
}