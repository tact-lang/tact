contract MultiPrimitives {
    intF: Int;
    boolF: Bool;
    addrF: Address;
    cellF: Cell;
    strF: String;

    init() {
        self.intF = 42;
        self.boolF = true;
        self.addrF = myAddress();
        self.cellF = emptyCell();
        self.strF = "hello";
    }
}