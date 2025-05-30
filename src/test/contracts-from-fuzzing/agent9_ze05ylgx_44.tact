fun test(a: Int,): Int { return 1; }

contract Test {
    receive() { test(1); }
}