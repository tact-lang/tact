contract PartialDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hello";
    d: Cell;
    e: Address;

    init() {
        self.d = emptyCell();
        self.e = myAddress();
    }
}