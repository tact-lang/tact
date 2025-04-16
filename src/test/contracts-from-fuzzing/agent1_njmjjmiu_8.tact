contract MapDeleteTest {
    receive() {
        // Test the .del() method for map deletion
        let m: map<Int, Int> = emptyMap();
        m.set(7, 123);
        m.set(42, 321);
        
        // Delete key 7 and verify it returns true
        let d1: Bool = m.del(7);
        dump(d1); // expected output: true
        
        // Try to delete key 7 again; expected false
        let d2: Bool = m.del(7);
        dump(d2); // expected output: false
        
        // Test deleting key 42 using set with null 
        m.set(42, null);
        dump(m.exists(42)); // expected output: false
    }
}
