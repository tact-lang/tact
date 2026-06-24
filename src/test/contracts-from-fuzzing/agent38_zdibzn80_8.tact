contract Test_replaceGet {
    receive() {
        // Create an empty map of Int to Int
        let m: map<Int, Int> = emptyMap();

        // Set a value for key 1
        m.set(1, 100);

        // Use replaceGet on an existing key: should return the old value (100) and update key 1 to 200
        let oldVal1: Int? = m.replaceGet(1, 200);

        // Use replaceGet on a non-existent key: should return null
        let oldVal2: Int? = m.replaceGet(2, 300);

        // Use replaceGet to delete a key: replacing existing key 1 with null should return the current value (200) and remove the entry
        let oldVal3: Int? = m.replaceGet(1, null);

        // Dump the results
        dump(oldVal1); // Expected output: 100
        dump(oldVal2); // Expected output: null
        dump(oldVal3); // Expected output: 200

        // Verify that key 1 has been deleted (should be null)
        dump(m.get(1)); // Expected output: null
    }
}
