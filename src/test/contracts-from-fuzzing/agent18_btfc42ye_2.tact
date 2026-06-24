fun testTryCatch(x: Int): Int {
    try {
        if (x == 0) {
            throw(1042);
        }
        return 100;
    } catch (e) {
        return e + 1;
    }
}
