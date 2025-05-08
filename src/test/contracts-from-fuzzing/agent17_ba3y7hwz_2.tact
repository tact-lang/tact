contract TestPrimitiveInt() {
    fun test() {
        // Test arithmetic on Int; 3/2 should round down to 1
        let a: Int = 3 / 2;
        // Dump the value; expected 1
        dump(a);
    }
    receive() { self.test(); }
}
