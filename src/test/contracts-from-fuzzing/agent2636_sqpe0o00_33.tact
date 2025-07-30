contract OptionalsDefaults {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
    addr: Address;
    c: Cell;

    init() {
        self.addr = myAddress();
        self.c = emptyCell();
    }
}