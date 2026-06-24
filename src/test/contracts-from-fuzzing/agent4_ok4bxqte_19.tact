contract TestNestedRepeatReturn {
    fun nestedRepeat(x: Int): Int {
        repeat(5) {
            repeat(5) {
                if (x == 10) { return x; }
            }
        }
        return x + 1;
    }
    receive () {}
}
