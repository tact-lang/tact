contract TestPrimitive {
    fun test() {
        // Testing integer division (257-bit signed integer)
        let a: Int = 3 / 2; // Expected: 1 (division rounds toward -∞)
        // Testing boolean operations
        let b: Bool = true && false; // Expected: false
        dump(a);
        dump(b);
    }
    receive() { self.test(); }
}
