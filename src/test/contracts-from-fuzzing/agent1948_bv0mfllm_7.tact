contract AllSerializationVariants {
    i1: Int as int4;
    i2: Int as uint4;
    i3: Int as int64;
    i4: Int as uint64;
    i5: Int as int257;
    i6: Int as uint256;
    c: Cell;
    s: Slice;
    a: Address;
    b: Bool;
    
    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
        self.i6 = 6;
        self.c = emptyCell();
        self.s = emptyCell().asSlice();
        self.a = myAddress();
        self.b = true;
    }
}