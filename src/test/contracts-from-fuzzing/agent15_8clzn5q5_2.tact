contract TestMultipleReturns {
    fun f(cond: Bool): Int {
        if (cond) {
            return 10;
        } else {
            { // nested block
                if (!cond) {
                    return 20;
                }
            }
            return 30;
        }
    }
}
