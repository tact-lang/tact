contract TestPrimitive() {
    // Testing a simple Int calculation
    fun test() {
         let a: Int = 1 + 1;
         dump(a); // expected output 2
    }

    receive() {
         self.test();
         cashback(sender());
    }
}
