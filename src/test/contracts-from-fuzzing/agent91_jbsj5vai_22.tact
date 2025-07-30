contract LargePrimitiveMix {
    int1: Int;
    int2: Int;
    int3: Int;
    bool1: Bool;
    bool2: Bool;
    str: String;
    slice1: Slice;
    slice2: Slice;
    c1: Cell;
    c2: Cell;
    addr1: Address;
    addr2: Address;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.bool1 = true;
        self.bool2 = false;
        self.str = "hi";
        self.slice1 = emptyCell().asSlice();
        self.slice2 = emptyCell().asSlice();
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.addr1 = myAddress();
        self.addr2 = myAddress();
    }
}
