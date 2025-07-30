contract ReturnTest2 {
    fun test(x: Int): Int {
        if(x > 0) {
            return 10;
        } else {
            return -10;
        }
        // Unreachable
    }

    receive () {}
}
