contract TernaryExprTest() {
    fun test() {
        // Test the ternary operator's right-associativity and precedence
        // Expression: false ? 1 : true ? 2 : 3
        // The evaluation should be: false ? 1 : (true ? 2 : 3), which results in 2
        let x = false ? 1 : true ? 2 : 3;
        dump(x); // Expected output: 2
    }

    receive() {
        self.test();
    }
}
