contract TestLogicalShortCircuitV3(counter: Int) {
    // Function that if executed, increments the contract's state counter
    fun dangerous() : Bool {
         self.counter = self.counter + 1;
         return true;
    }

    fun showcase() {
         // Reset counter to 0
         self.counter = 0;
         // Short-circuit &&: false && dangerous() should not call dangerous()
         let _ = false && self.dangerous();
         dump(self.counter); // Expected output: 0
         
         // Reset counter to 0
         self.counter = 0;
         // Short-circuit ||: true || dangerous() should not call dangerous()
         let _ = true || self.dangerous();
         dump(self.counter); // Expected output: 0
    }

    receive() {
         self.showcase();
    }
}
