fun foo(_: Int): Int { return 0 }

contract Test {
    // Valid usage: Using wildcard as function parameter in a global function
    receive() {
        foo(123);
    }
}
