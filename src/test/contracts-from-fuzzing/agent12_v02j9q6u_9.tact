contract TestExists {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Insert a key-value pair
        self.m.set(0, 0);
        
        // Test existence of an existing key
        let exists0: Bool = self.m.exists(0);
        dump(exists0); // Expected: true

        // Test existence of a non-existing key
        let exists42: Bool = self.m.exists(42);
        dump(exists42); // Expected: false
    }
}
