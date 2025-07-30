contract MapAdvancedTest {
    
    // This function creates two maps with identical key/value pairs inserted in different orders.
    // According to the documentation: shallow equality (==) compares underlying cell hashes and may return false even if the maps contain the same key/value pairs, while deepEquals() performs an entry-by-entry comparison and should return true.
    
    get fun testDeepEquality() : Bool {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        // Insert entries into m1 in order: 1, 2, 3
        m1.set(1, 10);
        m1.set(2, 20);
        m1.set(3, 30);
        
        // Insert entries into m2 in reverse order: 3, 2, 1
        m2.set(3, 30);
        m2.set(2, 20);
        m2.set(1, 10);
        
        // deepEquals should compare the entries regardless of insertion order
        return m1.deepEquals(m2);
    }
    
    // This function tests shallow equality using the '==' operator. Due to differences in serialization order,
    // shallow equality may return false even if deepEquals is true. This behavior is documented.
    get fun testShallowEquality() : Bool {
        let m1: map<Int, Int> = emptyMap();
        let m2: map<Int, Int> = emptyMap();
        
        m1.set(1, 10);
        m1.set(2, 20);
        m1.set(3, 30);
        
        m2.set(3, 30);
        m2.set(2, 20);
        m2.set(1, 10);
        
        // The shallow equality operator '==' compares cell hashes; if the serialization orders differ, it may return false.
        return m1 == m2;
    }
    
    // This function tests replaceGet on a non-existent key, confirming it returns null.
    get fun testReplaceGetOnMissing() : Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(5, 50);
        let oldVal: Int? = m.replaceGet(6, 60);
        return oldVal == null;
    }
    
    // This function tests successive replacement of a value and then deletion by replacing with null,
    // ensuring that the first replacement returns the old value and that after deletion, the key no longer exists.
    get fun testReplaceAndDelete() : Bool {
        let m: map<Int, Int> = emptyMap();
        m.set(7, 700);
        let oldVal: Int? = m.replaceGet(7, 770);
        // Now, m[7] should be 770
        let replacedCorrectly: Bool = oldVal != null && m.get(7)!! == 770;
        
        // Now delete the key by replacing with null
        let oldVal2: Int? = m.replaceGet(7, null);
        let deleted: Bool = (oldVal2 != null) && (m.get(7) == null);
        
        return replacedCorrectly && deleted;
    }
}
