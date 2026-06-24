contract TestExpr {
    // This contract tests a basic integer addition expression
    receive() {
        // The expression 1+1 should evaluate to 2
        dump(1 + 1);
    }
}
