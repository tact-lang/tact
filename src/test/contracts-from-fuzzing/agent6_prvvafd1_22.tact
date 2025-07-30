fun fact(n: Int): Int {
    if (n <= 1) {
        return 1;
    } else {
        return n * fact(n - 1);
    }
}

contract FactorialTest {
    receive() {
        let r = fact(5); // expected to be 120
        // Using require to check the result
        require(r == 120, "Factorial calculation error: expected 120");
        cashback(sender());
    }
}
