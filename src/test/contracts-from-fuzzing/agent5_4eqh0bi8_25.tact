contract MapResetTest {
    // Persistent state variable declared but not explicitly initialized
    m: map<Int, Int>;

    receive() {
        // Initially, persistent maps are empty and represented as null
        dump(self.m == null); // Expected: true
        
        // Create a local copy from persistent map; if null, use emptyMap()
        let local: map<Int, Int> = (self.m == null) ? emptyMap() : self.m;
        
        // Insert a key-value pair into the local map
        local.set(1, 100);
        
        // Save it back to the persistent state variable
        self.m = local;
        dump(self.m.isEmpty()); // Expected: false
        
        // Clear the persistent map by reassigning emptyMap()
        self.m = emptyMap();
        dump(self.m == null); // Expected: true
    }
}
