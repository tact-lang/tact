contract AllPrimitives {
    valInt: Int;
    valBool: Bool;
    valAddress: Address;
    valCell: Cell;
    valBuilder: Builder;
    valSlice: Slice;
    valString: String;

    init() {
        self.valInt = 123;
        self.valBool = false;
        self.valAddress = myAddress();
        self.valCell = emptyCell();
        self.valBuilder = beginCell();
        self.valSlice = emptyCell().asSlice();
        self.valString = "hi";
    }
}