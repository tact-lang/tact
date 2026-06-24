contract MultiplePrimitiveTypes {
    b: Bool;
    i: Int;
    s: String;
    addr: Address;
    c: Cell;

    init() {
        self.b = true;
        self.i = 42;
        self.s = "test";
        self.addr = myAddress();
        self.c = emptyCell();
    }
}