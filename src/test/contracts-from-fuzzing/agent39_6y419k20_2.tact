contract TestContract {
    // Minimal contract with valid let statement in receive
    init() {}
    receive() {
        let value: Int = 2 + 2;
        dump(value)
    }
}
