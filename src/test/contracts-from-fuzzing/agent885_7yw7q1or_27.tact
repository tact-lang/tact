// contract with address, bool, cell, slice, string and optionals in persistent state
contract AllPrimitives {
    addr: Address;
    flag: Bool;
    str: String;
    dataCell: Cell;
    dataSlice: Slice;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.addr = myAddress();
        self.flag = true;
        self.str = "hi";
        self.dataCell = emptyCell();
        self.dataSlice = emptyCell().asSlice();
        self.optInt = null;
        self.optBool = false;
    }
}
