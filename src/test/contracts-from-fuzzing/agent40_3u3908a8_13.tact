fun sum(_: Int, _: Int): Int {
    return 42;
}

contract Test {
    receive() {
        dump(sum(5, 7)); // Expected output: 42
    }
}
