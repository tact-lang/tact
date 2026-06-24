contract TestUnusedGetter {
    v: Bool = true;

    receive() {}

    // Getter that is declared but never used inside the contract
    get fun getUnused(): Bool {
        return self.v;
    }
}
