contract TestContract {
    addr: Address;
    sl: Slice;
    cl: Cell;

    init() {
        self.addr = myAddress();
        self.sl = emptyCell().asSlice();
        self.cl = emptyCell();
    }

    receive() {
        self.addr = self.addr;
        self.sl = self.sl;
        self.cl = self.cl;
    }
}
