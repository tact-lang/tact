trait Factorial {
    // Recursive function to compute factorial
    fun fact(n: Int): Int {
        if (n <= 1) {
            return 1;
        } else {
            return n * self.fact(n - 1);
        }
    }
}

contract Fact() with Factorial {
    receive() {
        dump(self.fact(5)); // Expected output: 120
    }
}
