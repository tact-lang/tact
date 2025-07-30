contract Test4 {
    fun f(x: Int): Int {
        if (x < 0) {
            {
                // Nested block
                return -1;
            }
        }
        return x;
    }
    fun main() {}
}
