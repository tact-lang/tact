contract TestControlFlow1 {
    // Test 1: Simple if/else with return
    fun absolute(a: Int) : Int {
        if (a >= 0) {
            return a;
        } else {
            return -a;
        }
    }

    receive() {}
}
