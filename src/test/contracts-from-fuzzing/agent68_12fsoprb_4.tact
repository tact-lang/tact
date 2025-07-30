trait T1 {
    // Abstract constant A must be overridden
    abstract const A: Int;

    // Function that returns A plus one
    fun getA(): Int {
        return self.A + 1;
    }
}

contract C() with T1 {
    // Override abstract constant A
    override const A: Int = 100;

    receive() {
        let r = self.getA(); // expected 101
        dump(r);
        cashback(sender());
    }
}
