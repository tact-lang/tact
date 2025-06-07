contract Test1 {
    // Regular function with early returns
    fun earlyReturn(a: Bool): Int {
        if (a) {
            return 1;
        } else {
            return 2;
        }
    }

    receive () {}
}
