contract FactorialGetter {
    receive() {}
    
    // Getter that computes factorial of x
    get fun fact(x: Int): Int {
        let res: Int = 1;
        let n: Int = x;
        while (n > 1) {
            res *= n;
            n -= 1;
        }
        return res;
    }
}
