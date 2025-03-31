contract TestMapReplaceGet {
    // Persistent state map from Int to Int
    m: map<Int, Int> = emptyMap();

    init() {
        // Insert a key-value pair
        self.m.set(5, 50);

        // Use replaceGet to update key 5
        let old1: Int? = self.m.replaceGet(5, 55);
        if (old1 == null || old1 != 50) {
            throw(101);
        }

        // Now delete key 5 using replaceGet with null
        let old2: Int? = self.m.replaceGet(5, null);
        if (old2 == null || old2 != 55) {
            throw(102);
        }

        // Try to replace a non-existing key
        let old3: Int? = self.m.replaceGet(5, 60);
        if (old3 != null) {
            throw(103);
        }
    }

    get fun getVal(k: Int): Int? {
        return self.m.get(k);
    }
}
