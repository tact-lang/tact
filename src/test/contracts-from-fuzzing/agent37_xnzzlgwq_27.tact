contract TestNestedRepeat2 {
    fun f(x: Int): Int {
        repeat (3) {
            if (x > 10) {
                return x + 1;
            } 
        }
        return 42;
    }
}
