contract ComplexReturn {
    fun multiComplex(x: Int): Int {
        if (x < 0) {
            return -1;
        } else {
            repeat (x) {
                if (x == 3) {
                    return 111;
                } else {
                    {
                        if (x == 5) { return 555; }
                    }
                }
            }
            return x * 2;
        }
    }
}
