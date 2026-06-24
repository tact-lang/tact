contract TestTypes {
    fun testIntegers() {
        // Testing integer operations and type representation
        let a: Int = 1 + 1; // expected 2
        let b: Int = 3 / 2; // expected 1, division rounds toward -∞
        dump(a);
        dump(b);
        dump(a + b); // expected 3
    }

    fun testBooleans() {
        // Testing Boolean type with logical operators
        let flag: Bool = true && false || true; // expected true
        dump(flag);
    }

    fun testAddressAndCell() {
        // Testing Address and Cell types
        let addr: Address = myAddress();
        dump(addr);
        let c: Cell = emptyCell();
        dump(c);
    }

    fun testStrings() {
        // Testing String type and its immutability
        let s: String = "Hello, Tact!";
        dump(s);
    }

    receive() {
        // Call all test functions via self
        self.testIntegers();
        self.testBooleans();
        self.testAddressAndCell();
        self.testStrings();
    }
}
