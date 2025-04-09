contract ManyFields {
    int1: Int;
    int2: Int as uint8;
    int3: Int as int16;
    bool1: Bool;
    boolOpt: Bool?;
    string1: String;
    slice1: Slice;
    cell1: Cell;
    builder1: Builder;
    address1: Address;
    intOpt: Int?;
    stringOpt: String?;
    cellOpt: Cell?;
    addressOpt: Address?;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.bool1 = true;
        self.boolOpt = false;
        self.string1 = "a";
        self.slice1 = emptyCell().asSlice();
        self.cell1 = emptyCell();
        self.builder1 = beginCell();
        self.address1 = myAddress();
        self.intOpt = 4;
        self.stringOpt = "b";
        self.cellOpt = emptyCell();
        self.addressOpt = myAddress();
    }
}
