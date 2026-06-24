contract Test_exists {
    receive() {
        // Create an empty map of Int to Int
        let m: map<Int, Int> = emptyMap();
        m.set(1, 42);

        // Test exists on present and missing keys
        let exists1: Bool = m.exists(1);
        let exists2: Bool = m.exists(2);

        dump(exists1); // Expected: true
        dump(exists2); // Expected: false
    }
}
