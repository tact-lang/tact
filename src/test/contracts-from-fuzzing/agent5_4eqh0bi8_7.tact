contract MapReplaceTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set initial values
        self.m.set(7, 70);
        self.m.set(42, 42);

        // Replace existing key 7 with a new value 68: should return true
        let replaced1: Bool = self.m.replace(7, 68);
        
        // Attempt to replace a non-existent key 8: should return false
        let replaced2: Bool = self.m.replace(8, 68);
        
        // Use replace with null to delete key 7
        self.m.replace(7, null);
        let v_after: Int? = self.m.get(7); // should be null
    }
}
