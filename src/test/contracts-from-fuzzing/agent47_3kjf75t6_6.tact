fun g(_: Int, _: Int): Int {
    return 0;
}

contract Test {
    receive() {
        g(1, 2);
    }
}
