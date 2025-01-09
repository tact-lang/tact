import "@stdlib/deploy";

fun factorial(n: Int): Int {
    if (n == 0) { return 1; }
    return n * factorial(n - 1);
}

contract RecursionTester with Deployable {
    get fun fib(n: Int): Int {
        if (n <= 0) { return 0; }
        if (n == 1) { return 1; }
        return self.fib(n - 1) + self.fib(n - 2); 
    }

    get fun fact(n: Int): Int {
        return factorial(n);
    }
}