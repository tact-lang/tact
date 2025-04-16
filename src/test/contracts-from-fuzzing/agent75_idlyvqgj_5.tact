// Test 1: Getter returning a primitive value (Int)
contract GetPrimitive {
    value: Int = 100;
    receive() {}

    // Getter function returning an Int value
    get fun getValue(): Int {
        return self.value;
    }
}
