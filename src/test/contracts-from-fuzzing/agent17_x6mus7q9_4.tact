contract TestTernary {
    fun run() {
        // Testing right-associative ternary operator
        // Expected: 3
        let a: Int = false ? 1 : (false ? 2 : 3);
        // Expected: 2
        let b: Int = false ? 1 : true ? 2 : 3;
        dump(a);
        dump(b);
    }
    receive() {
        self.run();
    }
}
