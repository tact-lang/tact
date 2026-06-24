contract InitDefaults {
    a: Int = 9;
    b: Bool = false;
    c: String = "init";
    d: Address;
    e: Cell;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
    }
}
