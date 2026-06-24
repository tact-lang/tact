contract TestDel {
    myMap: map<Int, Int>;

    receive() {
        self.myMap = emptyMap();
        // Inserting two key-value pairs
        self.myMap.set(7, 123);
        self.myMap.set(42, 321);
        
        // Deleting key 7 should succeed
        let del1: Bool = self.myMap.del(7);
        dump(del1); // Expected output: true
        
        // Deleting key 7 again should fail (already deleted)
        let del2: Bool = self.myMap.del(7);
        dump(del2); // Expected output: false
        
        // Using set with null to delete key 42
        self.myMap.set(42, null);
        let val42: Int? = self.myMap.get(42);
        dump(val42); // Expected output: null
    }
}
