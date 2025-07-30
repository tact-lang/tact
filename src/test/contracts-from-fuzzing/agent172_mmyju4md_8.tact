contract Test {
    // Test 5: Fallback binary message receiver using parameter of type Slice
    receive(msg: Slice) {
        // Instead of calling a non-existent function, use the 'empty' property or function on the Slice.
        // We assume that 'empty()' is a method returning a boolean if the slice is empty.
        if (!msg.empty()) { 
            // do nothing
        }
    }
}
