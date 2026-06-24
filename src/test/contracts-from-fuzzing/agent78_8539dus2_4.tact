contract TestRec {
    // Test recursive function behavior with Fibonacci computation
    fun fib(n: Int): Int {
        if (n <= 1) {
            return n;
        }
        return self.fib(n - 1) + self.fib(n - 2);
    }
    
    receive() {
        self.fib(5); // Expected result 5
    }
}
