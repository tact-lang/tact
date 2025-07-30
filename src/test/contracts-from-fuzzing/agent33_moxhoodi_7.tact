contract TestDeepEquals {
    receive() {
        // Initialize two maps of Int to Int
        let mapA: map<Int, Int> = emptyMap();
        let mapB: map<Int, Int> = emptyMap();
        
        // Set identical key-value pairs
        mapA.set(1, 100);
        mapB.set(1, 100);
        
        // They should be deep equal
        dump(mapA.deepEquals(mapB)); // expected output: true
        
        // Modify one map
        mapA.set(2, 200);
        
        // Now they should not be deep equal
        dump(mapA.deepEquals(mapB)); // expected output: false
    }
}
