contract Test {
    mp: map<Int, Int> = emptyMap();

    receive() {
        // Setup: set key 7 to value 70
        self.mp.set(7, 70);
        
        // Replace value for an existing key
        let replaced1: Bool = self.mp.replace(7, 68);
        dump(replaced1); // expected output: true
        
        // Attempt to replace a non-existing key
        let replaced2: Bool = self.mp.replace(8, 68);
        dump(replaced2); // expected output: false
    }
}
