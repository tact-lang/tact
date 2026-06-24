fun addOne(x: Int): Int {
    return x + 1;
}

contract Test {
    receive() {
        let a: Int = addOne(10);
        // just to use it
    }
}
