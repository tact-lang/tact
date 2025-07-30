contract TestMap() {
    fun test() {
        // Create a map from Int to Int
        let m: map<Int, Int> = emptyMap();
        m.set(10, 20);
        // Retrieve the value, expected to be 20
        let v: Int? = m.get(10);
        dump(v!!); // should output 20
        
        // Delete the key 10 and verify deletion
        m.del(10);
        dump(m.exists(10)); // should output 0 (false)
        dump(m.isEmpty());  // should output 1 (true)
    }
    receive() { self.test(); }
}
