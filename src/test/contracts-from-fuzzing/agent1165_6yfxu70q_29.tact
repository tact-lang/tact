contract MultiplePrimitives {
    int1: Int;
    bool1: Bool;
    addr1: Address;
    str1: String;
    cell1: Cell;
    slice1: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    
    init() {
        self.int1 = 0;
        self.bool1 = true;
        self.addr1 = myAddress();
        self.str1 = "hello";
        self.cell1 = emptyCell();
        self.slice1 = emptyCell().asSlice();
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
    }
}
