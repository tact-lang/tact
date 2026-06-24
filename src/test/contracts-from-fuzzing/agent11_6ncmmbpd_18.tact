contract Test {
    side_called: Bool = false;
    
    fun mark_side(): Bool {
        self.side_called = true;
        return false;
    }
    
    receive() {
        // Test logical OR short-circuit
        let res1: Bool = true || self.mark_side();
        // Test logical AND short-circuit
        let res2: Bool = false && self.mark_side();
        dump(self.side_called); // expected output: false, since neither mark_side() should be executed
    }
}
