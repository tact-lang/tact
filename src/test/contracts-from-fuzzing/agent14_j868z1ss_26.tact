contract DeepRecursionTest {
    state: Int = 0;

    // A recursive internal function that decrements 'n' until reaching 0
    fun rec(n: Int) {
        require(n >= 0, "n must be non-negative");
        if (n == 0) {
            self.state = self.state + 1;
        } else {
            self.rec(n - 1);
        }
    }

    // Receiver that starts the recursion
    receive("start") {
        self.rec(100);
    }
}
