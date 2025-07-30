contract TestContract {
    intField: Int = 1;
    boolField: Bool = false;
    strField: String = "hi";
    cellField: Cell; // uninitialized, check compilation
    addrField: Address; // uninitialized

    init() {
        self.cellField = emptyCell();
        self.addrField = myAddress();
    }

    receive() {}
}