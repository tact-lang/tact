contract TestTernary() {
    fun run() {
        // Test right-associativity of ternary operator
        let a = false ? 1 : (false ? 2 : 3);
        require(a == 3, "Ternary test failed: a != 3");
        let b = false ? 1 : (true ? 2 : 3);
        require(b == 2, "Ternary test failed: b != 2");
    }
    
    receive() {
        self.run();
    }
}
