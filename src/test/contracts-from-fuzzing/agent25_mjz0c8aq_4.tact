contract TestMap {
    fun test() {
        // Create a map from Int to Int, using emptyMap()
        let m: map<Int, Int> = emptyMap();
        
        // Set key 10 to value 42
        m.set(10, 42);
        
        // Retrieve the value; get returns an optional, use non-null assertion
        let value: Int = m.get(10)!!;
        dump(value); // Expected: 42
        
        // Check if key exists
        let exists: Bool = m.exists(10);
        dump(exists); // Expected: true
        
        // Delete key and check again for existence
        m.del(10);
        dump(m.exists(10)); // Expected: false
    }

    receive() {
        self.test();
    }
}
