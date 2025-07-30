contract TestPrimitive() {
    fun test() {
        // Testing basic integer arithmetic which is 257-bit signed at runtime
        let a: Int = 1 + 1;
        dump(a); // Expected output: 2
    }
    receive() { self.test(); }
}
