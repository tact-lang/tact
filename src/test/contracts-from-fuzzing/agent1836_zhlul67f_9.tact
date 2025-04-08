contract DiverseFields {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
    slice: Slice;
    builder: Builder;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "X";
        self.addr = myAddress();
        self.c = emptyCell();
        self.slice = emptyCell().asSlice();
        self.builder = beginCell();
    }
}