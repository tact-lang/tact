contract Test {
    int256_val: Int as int256;
    int1_val: Int as int1;
    int257_val: Int as int257;
    uint4_val: Int as uint4;
    uint64_val: Int as uint64;
    bool_val: Bool;
    text: String;
    addr: Address;
    builder: Builder;
    slice: Slice;
    cell_val: Cell;

    init() {
        self.int256_val = 0;
        self.int1_val = 0;
        self.int257_val = 0;
        self.uint4_val = 1;
        self.uint64_val = 2;
        self.bool_val = true;
        self.text = "test";
        self.addr = myAddress();
        self.builder = beginCell();
        self.slice = emptyCell().asSlice();
        self.cell_val = emptyCell();
    }
    
    receive() {
        return;
    }
}
