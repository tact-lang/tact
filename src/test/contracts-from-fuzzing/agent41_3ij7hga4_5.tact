contract Test {
    receive() {
        // Initialize map with two entries
        let m: map<Int, Int> = emptyMap();
        m.set(7, 123);
        m.set(42, 321);

        // Delete an existing key
        let d1: Bool = m.del(7);
        dump(d1); // expected output: true

        // Attempt to delete the same key again
        let d2: Bool = m.del(7);
        dump(d2); // expected output: false

        // Deletion via setting null
        m.set(42, null);
        let v: Int? = m.get(42);
        dump(v); // expected output: null
    }
}
