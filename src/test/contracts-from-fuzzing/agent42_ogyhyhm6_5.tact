fun add(_: Int, _: Int): Int {
    return 0;
}

contract Test {
    receive() {
        add(1, 2);
    }
}
