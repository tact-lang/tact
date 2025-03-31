contract Test1 {
    v: Int = 42;

    // Getter that returns a primitive Int value using correct state variable access
    get fun getV(): Int {
        return self.v;
    }

    // Receive function to ensure the contract is compiled
    receive() {}
}
