contract TestMaps() {
    fun run() {
        // Create an empty map with Int keys and Int values
        let m: map<Int, Int> = emptyMap();

        // Insert a value, then retrieve it
        m.set(1, 100);
        dump(m.get(1)!!); // Expected: 100

        // Replace the value under key 1
        m.replaceGet(1, 200); // Should return the old value 100
        dump(m.get(1)!!);     // Expected: 200

        // Check existence of a non-inserted key
        if (m.exists(2)) {
            dump(1);
        } else {
            dump(0); // Expected: 0, since key 2 does not exist
        }

        // Delete key 1 and then verify deletion
        m.del(1);
        if (m.exists(1)) {
            dump(1);
        } else {
            dump(0); // Expected: 0, key 1 deleted
        }
    }

    receive() {
        self.run();
    }
}
