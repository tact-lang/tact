contract TestOptionalExpr {
    receive() {
        // Test forced unwrap on a non-null optional
        let x: Int? = 15;
        dump(x!! + 5); // expecting 20

        // Test ternary operator with optional check
        let y: Int? = null;
        dump(y != null ? y!! : 100); // expecting 100

        // Inline ternary operator with expression
        dump((x != null) ? x!! * 2 : 0); // expecting 30
    }
}
