fun f(_: Int): Int { return 1; }

contract Test {
    receive() {
        f(100);
    }
}
