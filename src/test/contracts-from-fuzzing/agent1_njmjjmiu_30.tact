contract MapInsertionInForeachTest {
    receive() {
        // Test inserting new entries into the map during a foreach loop
        let m: map<Int, Int> = emptyMap();
        m.set(1, 10);
        m.set(2, 20);
        // Iterate over the map; during iteration, if key == 1, insert key 3
        foreach (k, v in m) {
            if (k == 1) {
                m.set(3, 30);
            }
            dump(k); // Dump the key from current iteration
        }
        // After the iteration, check if key 3 exists
        dump(m.exists(3)); // Expected output: true, regardless of whether key 3 was iterated
    }
}
