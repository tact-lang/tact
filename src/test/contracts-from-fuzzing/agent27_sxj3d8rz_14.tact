inline fun add(a: Int, b: Int): Int {
    return a + b;
}

contract InlineTest {
    receive() {
        dump(add(1, 2));
    }
}
