contract TestTernary() {
    fun showcase() {
        // Testing ternary operator associativity: should evaluate to 2
        let result = false ? 1 : true ? 2 : 3;
        dump(result);
    }
    
    receive() {
        self.showcase();
    }
}
