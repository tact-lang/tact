contract TestTernaryExpressions {
    fun showcase() {
        // Ternary operator expressions:
        // According to documentation:
        // false ? 1 : (false ? 2 : 3) should evaluate to 3
        let res1: Int = false ? 1 : (false ? 2 : 3);
        dump(res1); // expecting 3

        // Ternary operator is right-associative,
        // so false ? 1 : true ? 2 : 3 is interpreted as false ? 1 : (true ? 2 : 3), which should evaluate to 2
        let res2: Int = false ? 1 : true ? 2 : 3;
        dump(res2); // expecting 2
    }

    receive() {
        self.showcase();
    }
}
