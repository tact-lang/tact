fun d(_: Int): Int { return 0; }

contract Test {
    receive() {
        d(5);
    }
}
