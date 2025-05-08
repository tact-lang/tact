// Test Case: Map usage
contract TestMap {
    fun test() {
        // Create a map of Int to Int and use its methods
        let m: map<Int, Int> = emptyMap();
        m.set(0, 10);
        // Dump the value stored at key 0: expected 10
        dump(m.get(0)!!);

        // Delete the key and verify existence: expected false (0)
        m.del(0);
        dump(m.exists(0));
    }

    receive() {
        self.test();
    }
}
