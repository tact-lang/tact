// Variant 1: Valid usage of wildcard as function parameter (global function)
fun discardParam(_: Int): Int { return 100; }

contract Test {
    receive() {
        dump(discardParam(10));
    }
}
