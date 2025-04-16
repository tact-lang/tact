contract TestReplace {
    receive() {
        // Initialize a map of Int to Int
        let m: map<Int, Int> = emptyMap();
        
        // Set key 10 to value 100
        m.set(10, 100);
        
        // Replace value for an existing key (should succeed and return true)
        let rep1: Bool = m.replace(10, 200);
        dump(rep1);  // expected output: true

        // Replace value for a non-existing key (should fail and return false)
        let rep2: Bool = m.replace(20, 300);
        dump(rep2);  // expected output: false
    }
}
