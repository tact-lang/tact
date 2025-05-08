fun foo(_: Int, y: Int): Int {
    // '_' parameter is intentionally unused
    return y;
}

contract Test {
    receive() {
        dump(foo(10, 20));
    }
}
