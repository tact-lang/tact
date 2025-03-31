fun deepNestedReturn(x: Int): Int {
    if (x > 0) {
        { { { return x * 10; } } }
    }
    return -1;
}
