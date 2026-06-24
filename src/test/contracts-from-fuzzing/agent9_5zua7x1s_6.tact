inline fun add(a: Int, b: Int): Int {
    return a + b;
}

contract InlineTest {
    init() {}
    receive() {
        let result = add(3, 4);
    }
}
