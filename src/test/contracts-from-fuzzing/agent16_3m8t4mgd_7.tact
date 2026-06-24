contract TestTernary() {
    fun test() {
        // Testing ternary operator expressions
        // Expression: false ? 1 : (false ? 2 : 3) should evaluate to 3
        dump(false ? 1 : (false ? 2 : 3));
        
        // Expression: false ? 1 : true ? 2 : 3 should evaluate to 2
        dump(false ? 1 : true ? 2 : 3);
    }
    receive() {
        self.test();
    }
}
