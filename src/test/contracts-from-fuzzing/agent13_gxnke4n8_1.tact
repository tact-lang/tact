contract Test {
    value: Int = 123;
    
    receive() {}

    // Getter that returns a primitive integer value
    get fun getValue(): Int {
        return self.value;
    }
}
