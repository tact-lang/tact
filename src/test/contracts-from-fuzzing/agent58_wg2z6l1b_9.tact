contract UnusedGetter {
    receive() {}

    // Getter declared but never used in the contract
    get fun unused(): Int {
        return 777;
    }
}
