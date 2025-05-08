contract Test {
    value: Int = 42;
    
    // Receiver function to ensure the contract is fully compiled
    receive() {}

    get fun getValue(): Int {
        return self.value;
    }
}
