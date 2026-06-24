fun ct_abs(x: Int): Int {
    if (x < 0) {
        return -x;
    }
    return x;
}

contract Test {
    value: Int = ct_abs(-10);
}