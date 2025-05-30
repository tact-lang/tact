contract TestPrimitives {
    fun test() {
        // Test for Int arithmetic
        let a: Int = 1 + 1;          // should be 2
        let b = 0b1010;              // binary literal: 10 in decimal
        // Test for Boolean
        let c: Bool = true && false; // false
        // Test for String and conversion to Cell
        let d: String = "Test";
        let e: Cell = d.asComment();
        dump(a);
        dump(b);
        dump(c);
        dump(e);
    }

    // A dummy receiver to force compilation of functions
    receive() {}
}
