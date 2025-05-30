contract TestDelete {
    receive() {
        // Test the .del() method for deleting entries from a map
        let m: map<Int, Int> = emptyMap();
        m.set(7, 123);
        m.set(42, 321);

        // Delete existing key
        let success: Bool = m.del(7); // expected true
        dump(success);

        // Attempt to delete again the same key
        let fail: Bool = m.del(7); // expected false because already deleted
        dump(fail);

        // Delete non-existent key
        let nonExist: Bool = m.del(100); // expected false
        dump(nonExist);

        // Equivalent deletion by setting key to null
        m.set(42, null); // should delete key 42
        if (!m.exists(42)) {
            dump("Key 42 successfully deleted via set null");
        } else {
            dump("Key 42 still exists");
        }
    }
}
