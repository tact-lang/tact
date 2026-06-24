contract TernaryExprTest {
    fun test() {
        // Testing ternary operator associativity
        // Expected: false ? 1 : (false ? 2 : 3)  -> 3
        // Expected: false ? 1 : true ? 2 : 3    -> 2
        let a = false ? 1 : (false ? 2 : 3);
        let b = false ? 1 : true ? 2 : 3;
        dump(a);
        dump(b);
    }

    receive() {
        self.test();
    }
}
