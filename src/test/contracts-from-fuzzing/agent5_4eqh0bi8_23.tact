contract MapPersistentTest {
    // Persistent state variable; note that persistent maps are null when empty
    m: map<Int, Int>;

    receive() {
        // Without explicit initialization, persistent maps are empty (null)
        dump(self.m == null); // Expected: true (empty persistent maps are represented as null)
        
        // Set a value and then check isEmpty()
        self.m.set(5, 55);
        dump(self.m.isEmpty()); // Expected: false
    }
}
