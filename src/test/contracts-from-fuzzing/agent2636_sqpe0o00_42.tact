contract DefaultCombo {
    a: Int = 1;
    b: Bool = true;
    c: String = "test";
    d: Address;
    e: Cell;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
    }
}