struct Inner { a: Int; }
struct Outer { inner: Inner; }

contract TestChainedExpressions {
    receive() {
        // Test nested field access and chained expressions
        let x: Outer = Outer { inner: Inner { a: 42 } };

        // Access nested field
        let value: Int = x.inner.a; // Expected: 42
        dump(value);

        // Use nested field in a ternary expression and arithmetic operation
        let result: Int = (value > 40 ? value : 0) + (5 * (2 + 3));
        // Expected: (42) + (5 * 5) = 42 + 25 = 67
        dump(result);
    }
}
