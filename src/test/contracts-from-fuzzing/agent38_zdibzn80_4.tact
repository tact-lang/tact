contract Test_replace {
    receive() {
        // Create an empty map of Int to Int
        let m: map<Int, Int> = emptyMap();

        // Set a value for key 1
        m.set(1, 100);

        // Replace the value for an existing key (should return true)
        let replaced1: Bool = m.replace(1, 200);

        // Attempt to replace the value for a non-existent key (should return false)
        let replaced2: Bool = m.replace(2, 300);

        // Replace the value for key 1 with null to delete it (should return true)
        let replaced3: Bool = m.replace(1, null);

        // Dump the results
        dump(replaced1); // Expected output: true
        dump(replaced2); // Expected output: false
        dump(replaced3); // Expected output: true

        // Verify that key 1 has been deleted
        dump(m.get(1)); // Expected output: null
    }
}
