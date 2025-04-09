fun test(_: Int): Int {
    return 1;
}

contract Test {
    receive() {
        test(42);
    }
}
