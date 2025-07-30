contract TestOptionalExpressions {
    // This function tests optional expressions in Tact,
    // including the non-null assertion operator (!!) and the null literal.
    fun test() {
        // Declare an optional integer with a concrete value
        let op: Int? = 123;
        // The non-null assertion should yield the contained value if non-null
        dump(op!!); // Expected output: 123
        
        // Declare an optional integer explicitly as null and then assign a value
        let op2: Int? = null;
        op2 = 456;
        dump(op2!!); // Expected output: 456
        
        // Dump the null literal directly
        dump(null); // Expected representation of null
    }

    receive() {
        self.test();
    }
}
