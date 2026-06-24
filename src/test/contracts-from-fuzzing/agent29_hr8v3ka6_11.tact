contract TestReplaceGet {
    receive() {
        // Setup a map with two entries
        let m: map<Int, Int> = emptyMap();
        m.set(7, 70);
        m.set(42, 42);

        // Case 1: Replace existing key; should return old value (70) and update to 68
        let oldVal1: Int? = m.replaceGet(7, 68);
        dump(oldVal1!!); // expected output: 70

        // Case 2: Attempt to replace a non-existent key; should return null
        let oldVal2: Int? = m.replaceGet(8, 100);
        dump(oldVal2); // expected output: null

        // Case 3: Replace with null value to delete an existing entry; should return old value (42)
        let oldVal3: Int? = m.replaceGet(42, null);
        dump(oldVal3!!); // expected output: 42

        // Validate deletion: now key 42 should be missing
        let check: Int? = m.get(42);
        if (check == null) {
            dump(0); // expected output: 0 (indicating null)
        } else {
            dump(1);
        }
    }
}
