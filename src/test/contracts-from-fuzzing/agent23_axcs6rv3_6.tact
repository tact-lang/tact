/* Test #1: '_' as a function parameter (valid usage) */

contract Test {
    fun test(_: Int): Int { return 42; }
    receive() { self.test(10); }
}
