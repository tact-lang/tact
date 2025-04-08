contract TestContract {
    myBool: Bool;
    myInt: Int;
    myAddress: Address;
    myCell: Cell;
    mySlice: Slice;
    myBuilder: Builder;
    myString: String;
    optionalInt: Int?;
    optionalBool: Bool?;

    init() {
        self.myBool = true;
        self.myInt = 42;
        self.myAddress = myAddress();
        self.myCell = emptyCell();
        self.mySlice = self.myCell.asSlice();
        self.myBuilder = beginCell();
        self.myString = "hello";
        self.optionalInt = null;
        self.optionalBool = false;
    }
}