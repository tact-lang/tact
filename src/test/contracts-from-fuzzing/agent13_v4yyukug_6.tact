contract Test {
    m: map<Int, Int> = emptyMap();

    receive() {
        // Set a value for key 2
        self.m.set(2, 200);
        
        // Check existence: should be true
        let exists_true: Bool = self.m.exists(2);
        dump(exists_true); // expected output: true
        
        // Check non-existence: should be false
        let exists_false: Bool = self.m.exists(3);
        dump(exists_false); // expected output: false
    }
}
