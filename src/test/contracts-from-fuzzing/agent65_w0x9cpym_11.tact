contract TestNestedLoopReturn {
    fun test(): Int {
        let sum: Int = 0;
        repeat (3) {
            repeat (3) {
                if (sum > 0) {
                    return sum;
                }
                // Simulate some work
                sum = sum + 2;
            }
        }
        return sum;
    }
}
