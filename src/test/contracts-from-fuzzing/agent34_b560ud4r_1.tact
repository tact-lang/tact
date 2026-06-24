contract TestContract {
    int0: Int;
    bool0: Bool;
    addr0: Address;
    cell0: Cell;
    slice0: Slice;
    string0: String;

    init() {
        self.int0 = 0;
        self.bool0 = false;
        self.addr0 = myAddress();
        self.cell0 = emptyCell();
        self.slice0 = emptyCell().asSlice();
        self.string0 = "";
    }
}