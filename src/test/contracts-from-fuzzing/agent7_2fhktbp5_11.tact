contract TestTernary {
    receive() {
        // Valid ternary expressions
        let res1: Int = true ? 1 : 2;
        let res2: String = false ? "Yes" : "No";
        // Nested ternary with parentheses in consequence
        let res3: Int = false ? (false ? 1 : 2) : 3;
        dump(res1);
        dump(res2);
        dump(res3);
    }
}
