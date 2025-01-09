fun testFunc(a: Int): Int {
    return a == 123 || a == 456 ? (a == 10 ? a : a * 2) : a + 2;
}