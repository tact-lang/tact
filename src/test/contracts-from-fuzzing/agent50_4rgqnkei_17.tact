extends fun triple(self: Int): Int {
    return self * 3;
}

contract TestExtensionUse() {
    fun test() {
         let v = 7.triple();
         dump(v); // expect 21
    }
    
    receive() {
         self.test();
         cashback(sender());
    }
}
