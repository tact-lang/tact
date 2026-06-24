contract Test5 {
    x: Int = 0;
    // Test 5: Fallback receiver for binary messages using Slice
    receive(msg: Slice) {
         self.x = 55;
    }
}
