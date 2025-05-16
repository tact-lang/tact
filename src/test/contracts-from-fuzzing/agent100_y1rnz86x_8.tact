contract Test {
    fun complexReturn(x: Int): Int {
        if (x < 0) {
            return -1;
        }
        {
            if (x == 42) {
                return 42;
            }
        }
        {
            let y: Int = x * 2;
            {
                if (y > 100) {
                    return y;
                }
            }
        }
        return 0;
    }
}
