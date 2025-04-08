contract InitDefaultsVsExplicit {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
    d: Address;
    e: Cell;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
    }
}