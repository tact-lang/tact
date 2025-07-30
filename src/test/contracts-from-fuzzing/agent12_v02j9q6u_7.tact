contract TestReplaceGet {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set initial key-value pairs
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace value for an existing key, should return old value
        let oldVal1: Int? = self.m.replaceGet(7, 68);
        dump(oldVal1); // Expected: 70

        // Try to replace a non-existent key, should yield null
        let oldVal2: Int? = self.m.replaceGet(8, 68);
        dump(oldVal2); // Expected: null

        // Replace value with null for an existing key, which deletes it
        let oldVal3: Int? = self.m.replaceGet(42, null);
        dump(oldVal3); // Expected: 42

        // Verify deletion
        let check: Int? = self.m.get(42);
        dump(check); // Expected: null
    }
}
