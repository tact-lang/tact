contract TestTernary {
    fun test() {
        // According to documentation, the ternary operator ?: is right-associative.
        // So, the expression false ? 1 : (false ? 2 : 3) should evaluate to 3.
        let res1 = false ? 1 : (false ? 2 : 3);
        // And the expression false ? 1 : true ? 2 : 3 should evaluate to 2.
        let res2 = false ? 1 : true ? 2 : 3;
        
        dump(res1); // expected 3
        dump(res2); // expected 2
    }

    receive() {
        self.test();
    }
}
