contract TestMapReplace {
    m: map<Int, Int>;
    
    receive() {
        self.m = emptyMap();
        self.m.set(7, 70);
        self.m.set(42, 42);
        
        // Replace existing key 7
        let replaced1: Bool = self.m.replace(7, 68);
        dump(replaced1); // Expected: true

        // Attempt to replace non-existing key 8
        let replaced2: Bool = self.m.replace(8, 68);
        dump(replaced2); // Expected: false
    }
}
