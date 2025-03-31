contract TestReturn1 {
    fun nestedReturns(x: Int): Int {
        if (x > 0) {
            if (x == 42) {
                return 100;
            } else {
                return 200;
            }
        }
        while (x < 0) {
            return -1;
        }
        return 0;
    }

    receive() {}
}
