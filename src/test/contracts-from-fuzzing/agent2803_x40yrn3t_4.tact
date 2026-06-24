contract ManyPrimitives {
    int1: Int;
    bool1: Bool;
    int2: Int as uint32;
    bool2: Bool;
    str: String;
    sliceVal: Slice;
    cellVal: Cell;
    addressVal: Address;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.int2 = 42;
        self.bool2 = false;
        self.str = "abc";
        self.sliceVal = emptySlice();
        self.cellVal = emptyCell();
        self.addressVal = myAddress();
    }
}