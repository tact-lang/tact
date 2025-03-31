fun add(_: Int, _: Int): Int {
    return 42;
}

contract TestMultiWildcard {
    receive() {
        add(1, 2);
    }
}
