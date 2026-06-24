contract Test {
    value: Int = 123;
    
    receive() {}

    // Getter function returning a primitive Int value
    get fun getValue(): Int {
        return self.value;
    }
}
