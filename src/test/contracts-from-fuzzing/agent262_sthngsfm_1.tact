fun compute(x: Int): Int {
    if (x < 5) {
        return 100;
    }
    return 200;
}

contract Test {
    // Compile-time computed state initialization
    a: Int = compute(3);
    b: Int = compute(5);
}
