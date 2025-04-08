contract TestContract {
    simpleInt: Int;
    simpleBool: Bool;
    simpleAddress: Address;
    simpleCell: Cell;
    simpleSlice: Slice;
    simpleString: String;
    
    init() {
        self.simpleInt = 1;
        self.simpleBool = true;
        self.simpleAddress = myAddress();
        self.simpleCell = emptyCell();
        self.simpleSlice = emptyCell().asSlice();
        self.simpleString = "test";
    }
}