trait T1 {
    // Abstract function f that must be implemented
    abstract fun f(): Int;
}

trait T2 {
    // Abstract function f is also declared in this trait
    abstract fun f(): Int;
}

// Contract that inherits from both T1 and T2 and provides a single override for f()
contract CombinedAbstract() with T1, T2 {
    // Override the abstract function from both traits
    override fun f(): Int {
        return 42;
    }

    // Minimal receiver function for compilation
    receive() {
        // No operation needed
    }
}
