contract TestContract {
    fun showcase() {
        // Test modulo operator with negative divisor. Expected: 1 % -5 gives -4 as per documentation
        dump(1 % -5);
    }
    
    receive() {
        self.showcase();
    }
}