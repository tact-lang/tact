contract TinyOptChain {
    optA: Int?;
    optB: Int?;

    init() {
        self.optA = null;
        self.optB = null;
    }

    receive() {
        self.optA = 42;
    }
}