contract OnlyPtrs {
    addr: Address;
    slice: Slice;
    cell: Cell;
    builder: Builder;
    text: String;

    init() {
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.cell = emptyCell();
        self.builder = beginCell();
        self.text = "hello";
    }
}