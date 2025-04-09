contract RecursionReturn2 {
    fun fact(n: Int): Int {
        if (n <= 1) {
            return 1;
        } else {
            return n * self.fact(n - 1);
        }
    }

    receive() {}
}
