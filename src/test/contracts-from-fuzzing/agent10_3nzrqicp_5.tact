contract TestReplaceGet {
    m: map<Int, Int> = emptyMap();

    init() {
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace and get old value on an existing key
        let old1: Int? = self.m.replaceGet(7, 68); // key 7 now should map to 68
        dump(old1); // Expected to dump 70

        // Try replaceGet on a non-existing key
        let old2: Int? = self.m.replaceGet(8, 68); // key 8 does not exist
        if (old2 == null) {
            dump(0); // Expected to dump 0
        } else {
            dump(999); // Should not happen
        }

        // Replace with null which deletes the entry
        let old3: Int? = self.m.replaceGet(42, null); // key 42 deletion
        dump(old3); // Expected to dump 42
    }

    receive() {
        // Check updated value for key 7
        let val7: Int = self.m.get(7)!!; // Expected 68
        dump(val7);

        // Key 42 should be deleted
        if (self.m.exists(42)) {
            dump(999); // Should not happen
        } else {
            dump(0); // Expected to dump 0
        }
    }
}
