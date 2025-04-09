fun f(_: Int): Int {
    return 42;
}

contract Test {
    receive() {
        f(12);
    }
}
