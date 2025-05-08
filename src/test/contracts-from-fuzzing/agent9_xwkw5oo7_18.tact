contract TestBracesReturn {
    fun f(x: Int): Int {
        if (x < 0) {
            { return x * (-1); }  // Returns the absolute value for negative x
        } else {
            { return x; }         // Returns x as is for non-negative values
        }
    }
}
