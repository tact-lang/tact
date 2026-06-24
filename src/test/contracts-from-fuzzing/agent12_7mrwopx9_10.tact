contract TestBitwise {
    fun test() {
         // Testing negation and bitwise NOT
         let a = 5;
         let neg = -a;      // Expected: -5
         let not_a = ~a;    // Expected: -6
         dump(neg);
         dump(not_a);
    }
    
    receive() {
         self.test();
    }
}
