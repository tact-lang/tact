contract TestTernary {
    fun showcase() {
        // Ternary operator tests
        // According to operator precedence and right-associativity:
        // false ? 1 : (false ? 2 : 3) should yield 3
        // false ? 1 : true ? 2 : 3 should yield 2
        let a = false ? 1 : (false ? 2 : 3);
        let b = false ? 1 : true ? 2 : 3;
        a; b;
    }

    receive() {
        self.showcase();
    }
}
