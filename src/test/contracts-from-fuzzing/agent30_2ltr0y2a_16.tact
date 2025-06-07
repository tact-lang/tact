contract TestTernary {
    receive() {
        // Simple ternary operator
        let a: Int = true ? 10 : 20;
        dump(a);

        // Nested ternary with alternative cases without extra parentheses
        let b: Int = false ? 1 : true ? 2 : 3; // should resolve to 2
        dump(b);

        // Ternary where consequence requires parentheses
        let c: Int = false ? (false ? 1 : 2) : 3; // should resolve to 3
        dump(c);

        // Demonstrate a nested ternary with clear grouping
        let d: String = true ? "first" : (false ? "second" : "third");
        dump(d);
    }
}
