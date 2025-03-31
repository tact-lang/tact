contract UnusedGetter {
    v: Int = 100;

    // Getter declared but never used within the contract
    get fun getUnused(): Int {
        return self.v;
    }

    receive() {}
}
