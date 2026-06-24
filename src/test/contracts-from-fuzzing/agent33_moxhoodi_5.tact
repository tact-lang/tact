contract TestReplaceGet {
    receive() {
        // Initialize a map of Int to Int
        let m: map<Int, Int> = emptyMap();
        
        // Set key 5 to value 55
        m.set(5, 55);
        
        // Replace value for key 5 and retrieve the old value
        let oldValueExisting: Int? = m.replaceGet(5, 77);
        // Should dump the old value: 55
        dump(oldValueExisting!!);
        
        // Attempt to replace a non-existing key (key 6)
        let oldValueNonExisting: Int? = m.replaceGet(6, 99);
        // Should be null; dump 0 if null
        if (oldValueNonExisting == null) {
            dump(0);
        } else {
            dump(oldValueNonExisting!!);
        }
    }
}
