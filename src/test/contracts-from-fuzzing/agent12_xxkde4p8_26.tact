contract TestMapOps {
    receive() {
        // Initialize map with Int keys and Int values
        let m: map<Int, Int> = emptyMap();
        
        // Set some key-value pairs
        m.set(7, 70);
        m.set(42, 42);
        
        // Replace value for key 7 and get the old value
        let oldVal: Int? = m.replaceGet(7, 80);
        // Expect oldVal to be 70
        dump(oldVal!!);
        
        // Attempt to replace a non-existent key (8)
        let nonExists: Int? = m.replaceGet(8, 100);
        // nonExists should be null; use ternary check
        let check: Int = (nonExists == null) ? 999 : nonExists!!;
        dump(check);
        
        // Delete key 42 by setting its value to null
        m.set(42, null);
        let deleted: Int? = m.get(42);
        // Expect deleted to be null; produce a specific marker
        let marker: Int = (deleted == null) ? 888 : deleted!!;
        dump(marker);
    }
}
