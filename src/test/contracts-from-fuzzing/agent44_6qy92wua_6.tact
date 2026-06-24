contract Test {
    mp: map<Int, Int> = emptyMap();
    
    receive() {
        // Test map.get for an existing key
        self.mp.set(1, 100);
        let v: Int? = self.mp.get(1);
        dump(v!!); // should dump 100
    }
}
