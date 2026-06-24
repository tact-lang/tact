contract OnlyPrimitives {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;

    init() {
        self.i = 1;
        self.b = true;
        self.s = "text";
        self.addr = myAddress();
        self.c = emptyCell();
    }
}