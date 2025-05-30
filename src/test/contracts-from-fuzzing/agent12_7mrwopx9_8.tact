contract TestTernary {
    fun show() {
        // Testing ternary operator associativity
        let a = false ? 1 : (false ? 2 : 3); // Expected 3
        let b = false ? 1 : true ? 2 : 3;    // Expected 2
        dump(a);
        dump(b);
    }
    
    receive() {
        self.show();
    }
}
