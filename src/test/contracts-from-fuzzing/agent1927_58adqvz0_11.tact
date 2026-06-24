contract AllPrimitiveTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    cell: Cell;

    init() {
        self.i = 42;
        self.b = true;
        self.s = "abc";
        self.addr = myAddress();
        self.cell = emptyCell();
    }
}