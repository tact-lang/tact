contract Test {
    state: map<Int, Int>;

    receive() {
        // Initialize map
        self.state = emptyMap();
        
        // Setting initial values
        self.state.set(7, 70);
        self.state.set(42, 42);
        
        // Replace existing key
        let replaced1: Bool = self.state.replace(7, 68); // should succeed, replaced1 = true
        
        // Attempt to replace non-existing key
        let replaced2: Bool = self.state.replace(8, 68); // should fail, replaced2 = false
        
        // Dump values for inspection
        dump(replaced1);
        dump(replaced2);
        dump(self.state.get(7));
    }
}
