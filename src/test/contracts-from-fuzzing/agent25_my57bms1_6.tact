contract TestMapReplaceGet {
    receive() {
        // Create an empty map
        let m: map<Int, Int> = emptyMap();
        // Set a value for a key
        m.set(7, 70);
        
        // 1. Valid replacement: replace key 7's value from 70 to 68
        let oldVal1: Int? = m.replaceGet(7, 68); // Expected to return 70
        dump(oldVal1);

        // 2. Attempt to replace non-existing key 8
        let oldVal2: Int? = m.replaceGet(8, 68); // Expected to return null
        dump(oldVal2);

        // 3. Delete the key by replacing with null
        let oldVal3: Int? = m.replaceGet(7, null); // Expected to return 68 and delete key 7
        dump(oldVal3);
        
        // Verify key 7 is deleted
        let check: Int? = m.get(7); // Expected null
        dump(check);
    }
}
