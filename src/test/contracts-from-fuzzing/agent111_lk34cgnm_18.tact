contract TestComplexReturnFixed {
    fun compute(x: Int): Int {
        if (x == 0) {
            return 0;
        } else {
            {
                let y = x + 1;
                if (y > 10) {
                    return y;
                }
            }
            repeat (3) {
                if (x > 50) {
                    return x + 3;
                }
            }
            return x * 2;
        }
    }
    
    receive () {}
}
