contract TailRec {
    fun fact(n: Int, acc: Int): Int {
        if (n == 0) {
            return acc;
        } else {
            return self.fact(n - 1, acc * n);
        }
    }
    
    fun factorial(n: Int): Int {
        return self.fact(n, 1);
    }
}
