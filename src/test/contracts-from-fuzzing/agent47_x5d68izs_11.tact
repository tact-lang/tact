contract TestBlockStatements {
    receive() {
        // Block with multiple statements; the semicolon for the last statement is omitted intentionally
        {
            let a: Int = 1;
            let b: Int = 2;
            dump(a + b) // Expected to dump 3
        }
        // Block with a single statement, without a terminating semicolon
        {
            dump(42) // Expected to dump 42
        }
    }
}
