contract TestLoopEdge {
    fun gap(x: Int): Int {
        // If x is less than 5, execute a repeat loop,
        // which will run x times; if x > 0, the loop returns early.
        // But if x == 0, the loop body is not executed, and final return is reached.
        if (x < 5) {
            repeat(x) {
                // If x is greater than 0, this return will be executed in the first iteration.
                if (x > 0) {
                    return 42;
                }
            }
        }
        // Final return path if the loop isn't entered (x==0 or x>=5).
        return 1;
    }
}
