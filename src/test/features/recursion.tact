import "@stdlib/deploy";

contract RecursionTester with Deployable {
    get fun fib(n: Int): Int {
        if (n <= 0) { return 0; }
        if (n == 1) { return 1; }
        return self.fib(n - 1) + self.fib(n - 2); 
    }
}