contract TestMapExtensions {
    get fun test(): Int {
        // Test .isEmpty and .exists methods
        let m: map<Int, Int> = emptyMap();
        if (!m.isEmpty()) { return 100; }                // Should be empty initially
        if (m.exists(10)) { return 101; }                  // No key 10

        // Insert an element
        m.set(10, 50);
        if (!m.exists(10)) { return 102; }                 // Key 10 should now exist

        // Test replace: change value from 50 to 60
        let r: Bool = m.replace(10, 60);
        if (!r) { return 103; }
        if (m.get(10)!! != 60) { return 104; }

        // Test replaceGet: replace value from 60 to 70, and return old value
        let old : Int? = m.replaceGet(10, 70);
        if (old == null || old != 60) { return 105; }
        if (m.get(10)!! != 70) { return 106; }

        // Create another map with same entry for deepEquals testing
        let m2: map<Int, Int> = emptyMap();
        m2.set(10, 70);
        if (!m.deepEquals(m2)) { return 107; }            // deepEquals should be true

        // Test deletion: remove key 10
        let d: Bool = m.del(10);
        if (!d) { return 108; }
        if (m.exists(10)) { return 109; }

        return 0;  // All tests passed
    }
}
