trait T1 {
    // Abstract function declared in T1
    abstract fun f(): Int;
}

trait T2 {
    // Abstract function declared in T2
    abstract fun f(): Int;
}

contract C() with T1, T2 {
    // Override the abstract function from both T1 and T2
    override fun f(): Int {
        return 42;
    }
    
    receive() {}
}
