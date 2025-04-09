contract MixedPrimitives {
    fInt: Int;
    fBool: Bool;
    fAddress: Address;
    fCell: Cell;
    fSlice: Slice;
    fString: String;

    init() {
        self.fInt = 100;
        self.fBool = false;
        self.fAddress = myAddress();
        self.fCell = emptyCell();
        self.fSlice = self.fCell.asSlice();
        self.fString = "test primitive";
    }
}
