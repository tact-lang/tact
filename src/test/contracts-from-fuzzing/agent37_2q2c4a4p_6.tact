contract TestMapReplaceGet {
    receive() {
        // Initialize map with one entry
        let m: map<Int, Int> = emptyMap();
        m.set(5, 200);

        // Case 1: Replace existing key using replaceGet
        let old1: Int? = m.replaceGet(5, 300); // should return old value 200
        dump(old1!!); // Expected output: 200
        dump(m.get(5)!!); // Expected updated value: 300

        // Case 2: Attempt to replace a non-existent key
        let old2: Int? = m.replaceGet(10, 100); // key 10 does not exist, returns null
        if (old2 == null) {
            dump(1); // Expected branch: dump 1
        } else {
            dump(0);
        }

        // Case 3: Replace an existing key with null, which deletes the key
        m.set(7, 500);
        let old3: Int? = m.replaceGet(7, null); // should delete key 7 and return old value 500
        dump(old3!!); // Expected: 500
        if (m.get(7) == null) {
            dump(2); // Confirm deletion: dump 2
        } else {
            dump(0);
        }
    }
}
