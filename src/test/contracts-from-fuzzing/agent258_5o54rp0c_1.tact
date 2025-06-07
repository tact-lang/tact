fun ctReturnTest(x: Int): Int {
    if (x > 10) {
        return 100;
    }
    return 0;
}

contract Test {
    // Compile-time evaluation: x = 15 > 10 should return 100
    a: Int = ctReturnTest(15);
}