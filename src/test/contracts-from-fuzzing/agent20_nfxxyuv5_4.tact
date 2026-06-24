contract TestMapReplace {
    receive() {
        // Create an empty local map
        let m: map<Int, Int> = emptyMap();

        // Set a key-value pair
        m.set(10, 100);

        // Case 1: Replace valid key with new value
        let replaced1: Bool = m.replace(10, 200);
        dump(replaced1);  // Expect true
        let val1: Int? = m.get(10);
        dump(val1);     // Expect 200

        // Case 2: Replace a non-existent key
        let replaced2: Bool = m.replace(20, 300);
        dump(replaced2);  // Expect false

        // Case 3: Replace existing key with null to delete it
        let replaced3: Bool = m.replace(10, null);
        dump(replaced3);  // Expect true
        let val2: Int? = m.get(10);
        dump(val2);    // Expect null
    }
}
