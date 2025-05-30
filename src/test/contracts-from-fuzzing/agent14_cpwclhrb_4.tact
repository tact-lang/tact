contract TestMapReplace {
    dict: map<Int, Int> = emptyMap();

    receive() {
        // Set a key-value pair
        self.dict.set(5, 50);
        
        // Replace existing key value
        let replaced1: Bool = self.dict.replace(5, 55);
        // Replace non-existent key
        let replaced2: Bool = self.dict.replace(6, 66);
        
        dump(replaced1); // Expected: true
        dump(replaced2); // Expected: false
    }
}
