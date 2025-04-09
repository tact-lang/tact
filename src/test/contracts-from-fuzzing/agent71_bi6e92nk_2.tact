contract Test {
    fun test(x: Int): Int {
        if x > 0 {
            return x;
        } else {
            let y = x * -1;
            return y;
        }
    }
}
