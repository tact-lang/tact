contract MapChainedOperationsTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Step 1: Insert entries
        self.m.set(1, 10);
        self.m.set(2, 20);
        
        // Step 2: Replace key 1 with new value
        let replaced: Bool = self.m.replace(1, 15); // Expected: true
        
        // Step 3: Replace and get old value for key 2
        let oldValue: Int? = self.m.replaceGet(2, 25); // Expected: 20
        
        // Step 4: Delete key 1
        let delResult: Bool = self.m.del(1); // Expected: true
        
        // Step 5: Check existence of key 1 (should be false)
        let exists: Bool = self.m.exists(1);
        
        // Step 6: Compare with an empty map
        let e: map<Int, Int> = emptyMap();
        let deepEqual: Bool = self.m.deepEquals(e); // Expected: false because key 2 exists
        
        // Step 7: Clear the persistent map
        self.m = emptyMap();
        let isEmpty: Bool = (self.m == null); // Expected: true for persistent maps
        
        dump(replaced);   // Expected: true
        dump(oldValue);   // Expected: 20
        dump(exists);     // Expected: false
        dump(deepEqual);  // Expected: false
        dump(isEmpty);    // Expected: true
    }
}
