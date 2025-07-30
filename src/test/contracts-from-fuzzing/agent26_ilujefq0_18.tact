fun add(a: Int, b: Int): Int {
    return a + b;
}

contract AddTest {
    receive() {
        add(10, 20);
    }
}
