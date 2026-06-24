// Test Case 1: Return inside a repeat loop
fun loop_return(n: Int): Int {
    repeat(n) {
        if (n == 0) {
            return 100;
        }
    }
    return 200;
}
