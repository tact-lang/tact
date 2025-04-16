contract Test {
    receive() {
        // Empty block test: Block with single statement, no trailing semicolon
        {
            dump(1)
        }

        // Let statement with explicit type (valid)
        let a: Int = 10;
        dump(a);

        // If statement with only consequence
        if (a > 5) {
            dump(100);
        }

        // Assignment statement test
        a = 20;
        dump(a);

        // Try...catch statement test
        try {
            throw(404);
        } catch (e) {
            dump(e);
        }

        // Return statement is only valid inside functions; not applicable in receive block.
        // Instead, we can test a function with a return statement separately.
    }
}
