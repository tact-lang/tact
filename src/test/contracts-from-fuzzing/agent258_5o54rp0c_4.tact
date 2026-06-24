fun ctMultiReturn(x: Int): Int {
    if (x > 0) {
        return 10;
    } else if (x == 0) {
        return 0;
    } else {
        return -10;
    }
}

contract Test {
    a: Int = ctMultiReturn(-5);
}
