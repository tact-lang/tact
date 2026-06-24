contract Sha256ExprTest() {
    fun test() {
         // Test a compile-time expression using sha256 function
         // The SHA256 of "tact" is computed at compile-time.
         let h: Int = sha256("tact");
         dump(h);
    }
    
    receive() {
         self.test();
    }
}
