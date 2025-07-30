contract TestMapReplaceGet {
    dict: map<Int, Int> = emptyMap();

    receive() {
        // Set a key-value pair
        self.dict.set(10, 100);
        
        // Replace existing key value using replaceGet
        let oldVal1: Int? = self.dict.replaceGet(10, 110);
        dump(oldVal1!!); // Expected output: 100
        
        // Try replacing a non-existent key
        let oldVal2: Int? = self.dict.replaceGet(20, 200);
        // Should be null because key 20 doesn't exist
        dump(oldVal2);

        // Now delete an existing key by replacing with null
        let oldVal3: Int? = self.dict.replaceGet(10, null);
        dump(oldVal3!!); // Expected output: 110
        
        // Attempt to replace a deleted key
        let oldVal4: Int? = self.dict.replaceGet(10, 999);
        dump(oldVal4); // Expected output: null
    }
}
