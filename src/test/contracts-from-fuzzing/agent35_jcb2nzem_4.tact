fun nestedBlockReturn(a: Int): Int {
    { if (a > 0) { return a + 1; } }
    return 0;
}
