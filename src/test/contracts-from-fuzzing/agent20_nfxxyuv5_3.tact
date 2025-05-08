contract TestMapGet {
    receive() {
        // Create an empty local map
        let m: map<Int, Int> = emptyMap();

        // Case 1: Trying to get a value with a non-existent key (should yield null)
        let missing: Int? = m.get(5);
        // Dump the result to observe; expect null (or no value)
        dump(missing);

        // Case 2: Setting a key-value pair and then retrieving it
        m.set(5, 50);
        let value: Int? = m.get(5);
        // Expect to dump 50
        dump(value);
    }
}
