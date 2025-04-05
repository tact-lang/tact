trait Base {
    // Abstract function that must be implemented by inheriting contracts
    abstract fun f(): Int;
    
    // Concrete function that uses the abstract function
    fun g(): Int {
        return self.f() + 1;
    }
}

contract D() with Base {
    // Provide implementation for the abstract function
    override fun f(): Int {
        return 10;
    }

    receive() {
        let result = self.g();
        dump(result); // Expected output: 11
    }
}
