contract ManyStateVars {
    int1: Int;
    int2: Int?;
    bool1: Bool;
    bool2: Bool?;
    string1: String;
    string2: String?;
    cell1: Cell;
    cell2: Cell?;
    slice1: Slice;
    slice2: Slice?;
    addr1: Address;
    addr2: Address?;
    
    init() {
        self.int1 = 1;
        self.int2 = null;
        self.bool1 = true;
        self.bool2 = false;
        self.string1 = "abc";
        self.string2 = null;
        self.cell1 = emptyCell();
        self.cell2 = null;
        self.slice1 = emptyCell().asSlice();
        self.slice2 = null;
        self.addr1 = myAddress();
        self.addr2 = null;
    }
}