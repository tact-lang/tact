contract Test {
    receive() {
        // Test 1: Valid usage of map.set with key type Int and value type Int
        let mp: map<Int, Int> = emptyMap();
        mp.set(1, 42);
    }
}
