fun ctEarlyReturn(x: Int): Int {
    if (x > 0) {
        return 100;
    }
    return 200;
}

contract Test {
    a: Int = ctEarlyReturn(1);
}