contract TestExists {
    m: map<Int, Int>;

    receive() {
        self.m = emptyMap();
        self.m.set(42, 123);
        
        // Case 1: key exists
        let exists1: Bool = self.m.exists(42);
        dump(exists1); // Expected output: true
        
        // Case 2: key does not exist
        let exists2: Bool = self.m.exists(7);
        dump(exists2); // Expected output: false
    }
}
