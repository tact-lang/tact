contract TestMapReplaceGet {
    m: map<Int, Int> = emptyMap();

    init() {
        // Set initial value
        self.m.set(1, 100);
        // replaceGet on existing key should return old value (100) and update to 200
        let oldVal1: Int? = self.m.replaceGet(1, 200);
        // replaceGet on non-existing key should return null and leave map unchanged
        let oldVal2: Int? = self.m.replaceGet(2, 300);
        // replaceGet with null should delete the key; returns the old value (200)
        let oldVal3: Int? = self.m.replaceGet(1, null);
    }

    // Getter to check existence of key 1 (should be false after deletion)
    get fun exists1(): Bool {
        return self.m.exists(1);
    }

    // Getter to retrieve value for key 1 (should be null after deletion)
    get fun get1(): Int? {
        return self.m.get(1);
    }
}
