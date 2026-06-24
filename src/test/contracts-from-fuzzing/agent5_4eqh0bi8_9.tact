contract MapDelTest {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Setting two key-value pairs
        self.m.set(7, 123);
        self.m.set(42, 321);
        
        // Deleting key 7
        let delSuccess: Bool = self.m.del(7);
        
        // Getting value for key 7 should now be null
        let v_after: Int? = self.m.get(7);
    }
}
