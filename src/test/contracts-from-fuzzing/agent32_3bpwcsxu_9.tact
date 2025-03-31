contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Setting two entries
        self.m.set(7, 123);
        self.m.set(42, 321);
        
        // Deleting an existing key. Expected result: true
        let d1: Bool = self.m.del(7);
        dump(d1);
        
        // Attempting to delete the same key again. Expected result: false
        let d2: Bool = self.m.del(7);
        dump(d2);
    }
}
