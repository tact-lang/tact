// Test: Getter for primitive value (Int)
contract TestPrimGetter {
    value: Int = 42;
    
    receive() {}

    get fun getValue(): Int {
        return self.value;
    }
}
