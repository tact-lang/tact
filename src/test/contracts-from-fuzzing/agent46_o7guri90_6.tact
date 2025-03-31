contract TestMapReplaceGet {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key 7 and get old value
        let oldVal1: Int? = self.m.replaceGet(7, 68);
        dump(oldVal1); // Expected: 70

        // Attempt to replace non-existent key 8
        let oldVal2: Int? = self.m.replaceGet(8, 68);
        dump(oldVal2); // Expected: null

        // Use replaceGet with null to delete the entry at key 7
        self.m.set(7, 70);
        let oldVal3: Int? = self.m.replaceGet(7, null);
        dump(oldVal3); // Expected: 70, and key 7 should be deleted
        let check: Int? = self.m.get(7);
        dump(check); // Expected: null
    }
}
