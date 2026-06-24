contract Test {
    mp: map<Int, Int> = emptyMap();
    
    receive() {
        // Test map.set with key Int and value Int
        self.mp.set(1, 100);
    }
}
