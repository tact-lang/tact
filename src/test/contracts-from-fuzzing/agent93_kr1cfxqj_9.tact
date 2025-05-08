contract TestNestedLoopReturn {
    fun nestedLoopReturn(a: Int): Int {
        let mutable: Int = 0;
        while (mutable < 10) {
            {
                // Nested block: if condition met, return from within the block
                if (mutable == a) {
                    return mutable + 100;
                }
            }
            mutable = mutable + 1;
        }
        return -1;
    }
}
