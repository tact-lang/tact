fun add(a: Int, b: Int): Int { return a + b; }

contract TestFunctionCalls {
    receive() {
        // Testing basic function call expression and chaining.
        dump(add(1, 2));                // expected: 3
        dump(add(add(3, 4), add(5, 6)));  // expected: (3+4)+(5+6)=7+11=18
    }
}
