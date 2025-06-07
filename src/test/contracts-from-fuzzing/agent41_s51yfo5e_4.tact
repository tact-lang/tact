contract TestMap {
    fun test() {
        // Create a map of Int to Int
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        m.set(20, 200);
        dump(m.get(10)!!); // Expect 100
        dump(m.get(20)!!); // Expect 200
        dump(m.exists(30)); // Expect false
        // Now delete a key
        m.del(10);
        dump(m.exists(10)); // Expect false
        // Test shallow equality with emptyMap()
        dump(m == emptyMap()); // Possibly false because m still has key 20
    }
    receive() { self.test(); }
}
