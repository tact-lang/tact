contract TestReplaceGet {
    m: map<Int, Int>;

    receive() {
        // Initialize the map
        self.m = emptyMap();

        // Set initial key-value pairs
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Case 1: Replacing an existing key returns the old value
        let oldVal1: Int? = self.m.replaceGet(7, 68);
        dump(oldVal1); // Expected to dump 70

        // Case 2: Replacing a non-existing key returns null
        let oldVal2: Int? = self.m.replaceGet(8, 68);
        dump(oldVal2); // Expected to dump null

        // Case 3: Replacing an existing key with null deletes the entry and returns the old value
        let oldVal3: Int? = self.m.replaceGet(42, null);
        dump(oldVal3); // Expected to dump 42
        
        // Confirm deletion: getting key 42 should return null
        let check: Int? = self.m.get(42);
        dump(check); // Expected to dump null
    }
}
