contract TestExpr {
    fun test() {
        // Testing arithmetic operator precedence
        // Expected: 5 + 4 - 5 * 4 / 5 % 4 = 9
        let a = 5 + 4 - 5 * 4 / 5 % 4;
        dump(a);
    }
    
    receive() {
         self.test();
    }
}
