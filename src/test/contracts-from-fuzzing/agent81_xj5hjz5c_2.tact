contract TestIntArithmetic() {
    fun run() {
         let a: Int = 1 + 2;         // Expected 3
         let b: Int = 3 / 2;         // Expected 1 (round toward -∞)
         dump(a);                  // should dump 3
         dump(b);                  // should dump 1
    }
    receive() {
         self.run();
    }
}
