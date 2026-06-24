fun add(x: Int, y: Int): Int {
    return x + y;
}

contract TestInlineArguments {
    receive() {
        dump(add(40, 2)); // Expected output: 42
    }
}
