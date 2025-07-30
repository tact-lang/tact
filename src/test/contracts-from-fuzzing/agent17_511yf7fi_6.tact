contract TestMapReplaceGet {
    receive() {
        let m: map<Int, Int> = emptyMap();
        
        // Setting some values
        m.set(7, 70);
        m.set(42, 42);
        
        // Replace using replaceGet for an existing key
        let oldVal1: Int? = m.replaceGet(7, 68); // expected to be 70
        
        // Replace using replaceGet for a non-existing key
        let oldVal2: Int? = m.replaceGet(8, 68); // expected to be null
        
        // Replace with null to delete an existing key
        let oldValDel: Int? = m.replaceGet(42, null); // expected to be 42, and key 42 is deleted
        
        // Check that the key has been deleted
        let getAfter: Int? = m.get(42); // expected to be null
    }
}
