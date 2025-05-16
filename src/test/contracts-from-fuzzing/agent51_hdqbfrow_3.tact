// Test case 1: Basic function with standard return
contract TestEarly {
    fun test(x: Int) : Int {
        if (x < 10) {
            return 0;
        } else {
            return x;
        }
    }
}
