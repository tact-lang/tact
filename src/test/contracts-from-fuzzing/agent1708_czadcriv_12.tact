contract TestContract {
    singleInt: Int;
    singleBool: Bool;
    singleString: String;
    singleSlice: Slice;
    singleCell: Cell;
    singleAddress: Address;

    init() {
        self.singleInt = 1;
        self.singleBool = true;
        self.singleString = "ok";
        self.singleSlice = emptyCell().asSlice();
        self.singleCell = emptyCell();
        self.singleAddress = myAddress();
    }
}