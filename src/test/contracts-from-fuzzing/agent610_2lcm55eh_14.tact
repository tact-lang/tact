// Test long contract with many primitive fields with optional and serialization
contract ManyPrimitives {
    int1: Int as uint8;
    int2: Int?;
    bool1: Bool;
    bool2: Bool?;
    str: String;
    cell: Cell;
    slc: Slice;
    bldr: Builder;
    addr: Address;

    init() {
        self.int1 = 255;
        self.int2 = null;
        self.bool1 = false;
        self.bool2 = true;
        self.str = "hello";
        self.cell = emptyCell();
        self.slc = emptyCell().asSlice();
        self.bldr = beginCell();
        self.addr = myAddress();
    }
}