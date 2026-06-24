contract TestContract {
    optAddr: Address?;

    init() {
        self.optAddr = null;
    }

    receive() {
        self.optAddr = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    }
}