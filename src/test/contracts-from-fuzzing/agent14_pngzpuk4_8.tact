contract TestBitwise() {
    fun run() {
        // Testing bitwise negation and arithmetic negation
        let a: Int = 5;
        let not_a = ~a;         // expected: ~5 should be -6
        dump(not_a);            
        
        let neg_not_a = -not_a; // expected: -(-6) should be 6
        dump(neg_not_a);

        let not_neg_a = ~(-a);  // expected: ~(-5) should be 4
        dump(not_neg_a);
    }
    
    receive() {
        self.run();
    }
}
