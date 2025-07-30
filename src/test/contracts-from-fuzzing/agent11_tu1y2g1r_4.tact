contract TestBooleanExpressions {
    // This function tests boolean expressions:
    // - Logical AND, OR, and NOT
    // - Ternary operator with booleans
    fun test() {
        let a = true;
        let b = false;
        // a && b should be false
        dump(a && b);
        // a || b should be true
        dump(a || b);
        // !a should be false
        dump(!a);
        // Ternary: false ? 10 : 20 should yield 20
        dump(b ? 10 : 20);
        // Ternary: true ? 10 : 20 should yield 10
        dump(a ? 10 : 20);
    }

    receive() {
        self.test();
    }
}
