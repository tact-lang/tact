contract TestPrimitive {
    fun test() {
         let a: Int = 1 + 1;
         let b: Int = 2 * 3;
         dump(a); // Expected: 2
         dump(b); // Expected: 6
    }
    receive() { self.test(); }
}
