contract TestDel {
    receive() {
        // Test 4: Deleting entries using .del() method
        let m: map<Int, Int> = emptyMap();
        m.set(7, 123);
        m.set(42, 321);

        let del1: Bool = m.del(7);     // expected true, key 7 existed
        let del2: Bool = m.del(7);     // expected false, key 7 already deleted
        
        // Alternatively, setting a key to null should delete it
        m.set(42, null);             // deletes key 42
        let exists42: Bool = m.exists(42); // expected false
    }
}
