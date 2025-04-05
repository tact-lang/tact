contract TestMapOperations {
    fun test() {
        // Create an empty map, set a key, and retrieve it
        let m: map<Int, Int> = emptyMap();
        m.set(0, 10);
        dump(m.get(0)!!); // Expected to dump 10
    }
    receive() {
        self.test();
        return;
    }
}
