contract TestContract {
    valA: Int as int64;
    valB: Int as uint256;
    valC: Int as coins;

    init() {
        self.valA = -42;
        self.valB = 123456789;
        self.valC = 1000;
    }
}