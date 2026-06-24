contract MapIsEmptyTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Initially, the map should be empty
        let empty_before: Bool = self.m.isEmpty();
        
        // Set a key-value pair
        self.m.set(1, 10);
        
        // After insertion, the map should not be empty
        let empty_after: Bool = self.m.isEmpty();
    }
}
