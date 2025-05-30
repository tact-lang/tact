// Test snippet 2: Early return in a function
contract Test2 {
    receive() {}
    fun test(a: Int): Int {
        if (a > 10) {
           return a;
        }
        return a + 1;
    }
}
