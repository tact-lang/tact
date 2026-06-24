contract TestReturnTernary {
    fun retTernary(x: Int): Int {
        return x > 10 ? (x + 1) : (x - 1);
    }
}
