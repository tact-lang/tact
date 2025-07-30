contract TestRepeatReturn {
    fun repeatReturn(x: Int): Int {
        repeat (5) {
            if (x == 3) {
                return x + 10;
            }
        }
        return x;
    }
}
