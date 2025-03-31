fun compileTest1(x: Int): Int {
    if (x > 0) {
        return x;
    }
    return 42;
}

contract Test {
    a: Int = compileTest1(10);
}
