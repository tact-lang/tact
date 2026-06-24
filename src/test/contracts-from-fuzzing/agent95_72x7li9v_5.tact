fun test(_: Int): Int { return 42; }

contract Test {
    receive() {
        test(10);
    }
}
