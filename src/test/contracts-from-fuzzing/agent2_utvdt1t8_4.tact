contract Test {
    receive() {
        // Using a local map for testing .set and .get methods
        let m: map<Int, Int> = emptyMap();
        m.set(10, 100);
        // Retrieve existing key
        let exists: Int = m.get(10)!!;
        dump(exists); // Expect: 100
        // Retrieve non-existent key (should return null)
        let nonExists: Int? = m.get(20);
        if (nonExists == null) {
            dump(0); // dump 0 if key 20 not found
        }
    }
}
