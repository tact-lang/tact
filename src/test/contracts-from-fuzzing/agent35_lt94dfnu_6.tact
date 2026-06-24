fun add(a: Int, b: Int): Int {
    return a + b;
}

contract TestReturn {
    receive() {
        dump(add(1, 2));
    }
}
