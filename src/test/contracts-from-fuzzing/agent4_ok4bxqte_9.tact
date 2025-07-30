/* Test Case 1: Early return inside a repeat loop */
contract TestRepeatReturn {
    fun repeatReturn(): Int {
        repeat(10) {
            if (true) { return 5; }
        }
        return 10;
    }
    receive () {}
}
