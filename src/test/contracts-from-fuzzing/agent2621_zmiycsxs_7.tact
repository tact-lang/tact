contract Test {
    a: Cell;
    b: Address;
    init() {
        self.a = emptyCell();
        self.b = myAddress();
    }
}