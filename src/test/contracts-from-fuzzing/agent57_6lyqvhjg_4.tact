contract TestMaps {
    fun test() {
        // Create a map of Int to Int and test its basic operations
        let m: map<Int, Int> = emptyMap();
        m.set(100, 456);
        dump(m.get(100)!!); // Expected output: 456

        let old: Int? = m.replaceGet(100, 789);
        dump(old!!);       // Expected output: 456

        dump(m.get(100)!!); // Expected new value: 789

        let del1: Bool = m.del(100);
        dump(del1);        // Should output true

        let del2: Bool = m.del(100);
        dump(del2);        // Should output false (idempotent deletion)

        dump(m.isEmpty()); // Should output true as map is now empty
    }

    receive() {
        self.test();
    }
}
