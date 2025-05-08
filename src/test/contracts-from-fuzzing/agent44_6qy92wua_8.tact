contract Test {
    mp: map<Int, Int> = emptyMap();
    
    receive() {
        // Test .replaceGet on an existing key
        self.mp.set(7, 70);
        let oldVal1: Int? = self.mp.replaceGet(7, 68); // Key 7 changed from 70 to 68
        dump(oldVal1!!); // Expected output: 70
        
        // Test .replaceGet on a non-existing key
        let oldVal2: Int? = self.mp.replaceGet(8, 68); // Nothing changes, returns null
        dump(oldVal2); // Expected output: null
        
        // Test .replaceGet to delete an entry: passing null value leads to deletion
        self.mp.set(42, 42);
        let oldVal3: Int? = self.mp.replaceGet(42, null); // Deletes key 42
        dump(oldVal3!!); // Expected output: 42
        
        // Verify deletion
        let exists: Bool = self.mp.exists(42);
        dump(exists); // Expected output: false
    }
}
