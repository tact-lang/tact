contract ExprTernary {
    fun test() {
        // Ternary operator is right-associative
        // Expected: false ? 1 : (true ? 2 : 3) => 2
        let res = false ? 1 : true ? 2 : 3;
        dump(res);
    }
    
    receive() {
        self.test();
    }
}
