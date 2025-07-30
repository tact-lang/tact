contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Case 1: Replace existing key with new value, get old value
        self.m.set(7, 70);
        let oldVal1: Int? = self.m.replaceGet(7, 68);
        // Expected: old value 70 is returned, and key 7 now holds 68
        dump(oldVal1!!); // should dump 70
        
        // Case 2: Replace non-existent key, should return null
        let oldVal2: Int? = self.m.replaceGet(8, 80);
        if (oldVal2 == null) {
            dump(1); // dump 1 as true indicator for null
        } else {
            dump(0);
        }
        
        // Case 3: Replace with null to delete an existing key
        self.m.set(42, 42);
        let oldVal3: Int? = self.m.replaceGet(42, null);
        // Expected: returns 42, and key 42 is removed from the map
        dump(oldVal3!!); // should dump 42
        dump(self.m.exists(42) ? 1 : 0); // Expected to dump 0 (false)
    }
}
