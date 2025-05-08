contract NoDefaults {
    myBool: Bool;
    myInt: Int;
    myString: String;
    myAddress: Address;
    myCell: Cell;
    mySlice: Slice;

    init() {
        self.myBool = false;
        self.myInt = 42;
        self.myString = "abc";
        self.myAddress = myAddress();
        self.myCell = emptyCell();
        self.mySlice = self.myCell.asSlice();
    }
}