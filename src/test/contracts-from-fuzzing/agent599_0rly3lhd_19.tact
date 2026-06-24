contract TestContract {
    addr: Address;
    sl: Slice;
    cl: Cell;
    st: String;

    init() {
        self.addr = myAddress();
        self.sl = emptyCell().asSlice();
        self.cl = emptyCell();
        self.st = "test";
    }
}