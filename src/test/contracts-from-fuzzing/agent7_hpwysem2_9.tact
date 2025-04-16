trait T1 {
    // Declare an abstract constant A
    abstract const A: Int;
}

trait T2 {
    // Also declare an abstract constant A
    abstract const A: Int;
}

contract M() with T1, T2 {
    // Provide a single override that should satisfy both traits
    override const A: Int = 42;
    
    receive() {
        // Check that the constant is correctly overridden
        require(self.A == 42, "A error");
        cashback(sender());
    }
}
