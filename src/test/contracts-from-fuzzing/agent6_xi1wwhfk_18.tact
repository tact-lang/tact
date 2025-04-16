contract TestRelation() {
    fun test() {
        // Testing relational operator precedence and evaluation:
        // (1 + 2 * 3) should equal 7, so (1 + 2 * 3) == 7 should yield true, using ternary returns 1 if true, else 0.
        dump((1 + 2 * 3) == 7 ? 1 : 0);
    }
    
    receive() {
        self.test();
        cashback(sender());
    }
}
