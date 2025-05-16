contract Test {
    receive() {
        // Testing map.set and map.get with valid key-value pair using correct syntax
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42); // Insert key 1 with value 42
        let v: Int = m.get(1)!!; // Retrieve value using non-null assertion
        dump(v); // Expected to dump 42
    }
}
