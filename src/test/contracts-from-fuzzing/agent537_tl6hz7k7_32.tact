contract TestContract {
    coinVal: Int as coins;

    init() {
        self.coinVal = 0;
    }

    receive() {
        self.coinVal = ton("0.01");
    }
}
