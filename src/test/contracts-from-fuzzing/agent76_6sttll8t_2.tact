contract TestInt() {
    fun test() {
        // Test integer division rounding toward -∞. 3/2 = 1
        let a: Int = 3 / 2;
        dump(a);
    }

    receive() { self.test(); }
}
