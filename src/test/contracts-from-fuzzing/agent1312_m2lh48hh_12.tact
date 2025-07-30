contract ManyPersistent {
    int1: Int;
    int2: Int;
    int3: Int;
    bool1: Bool;
    addr: Address;
    text: String;
    cl: Cell;
    slc: Slice;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.bool1 = false;
        self.addr = myAddress();
        self.text = "abc";
        self.cl = emptyCell();
        self.slc = emptyCell().asSlice();
    }
}