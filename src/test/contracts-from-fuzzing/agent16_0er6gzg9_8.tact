contract Test {
    receive() {
        // Testing map.replaceGet method on existing and non-existing keys, and with null to delete entries
        let m: map<Int, Int> = emptyMap();

        // Set initial values
        m.set(5, 500);
        m.set(7, 700);

        // Test: Replace existing key 5 with a new value
        let oldValue1: Int? = m.replaceGet(5, 555); // Should return 500
        dump(oldValue1); // Expected output: 500

        // Test: Replace non-existing key 6, should return null
        let oldValue2: Int? = m.replaceGet(6, 666); // No key 6 exists
        dump(oldValue2); // Expected output: null (or no output)

        // Test: Replace existing key 7 with null, which deletes the entry
        let oldValue3: Int? = m.replaceGet(7, null);
        dump(oldValue3); // Expected output: 700
        
        // Verify that key 7 is deleted
        let exists7: Bool = m.exists(7);
        dump(exists7); // Expected output: false
    }
}
