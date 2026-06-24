contract Test6 {
    fun test(x: Int): Int {
        if (x > 5) {
            {
                if (x % 2 == 0) {
                    return x;
                } else {
                    return x + 1;
                }
            }
        } else {
            return x - 1;
        }
    }
}
