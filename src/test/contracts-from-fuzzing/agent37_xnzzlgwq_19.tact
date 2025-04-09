contract TestRecursionFixed {
    fun rec(x: Int): Int {
        if (x <= 0) {
            return 0;
        } else {
            return self.rec(x - 1) + x;
        }
    }
}
