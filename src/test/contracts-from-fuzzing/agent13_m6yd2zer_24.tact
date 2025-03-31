contract TestRecursion {
    fun fact(n: Int): Int {
        if (n <= 1) { return 1; }
        return n * self.fact(n - 1);
    }
    
    receive() {
        dump(self.fact(5)); // expected output: 120
    }
}
