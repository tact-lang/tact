contract Test {
    v: Int = 42;

    // Receiver to ensure the contract is fully compiled
    receive() {}

    // Getter function returning a primitive Int
    get fun getV(): Int {
        return self.v;
    }
}
