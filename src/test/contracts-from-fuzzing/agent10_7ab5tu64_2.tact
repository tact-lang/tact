trait Parent2 {
    // Abstract function: must be implemented
    abstract fun f(): Int;
    
    // Default implementation that calls the abstract function
    fun callF(): Int {
        return self.f();
    }
}

contract Child2() with Parent2 {
    // Override the abstract function
    override fun f(): Int { 
        return 42;
    }
    
    // Getter that calls the trait function indirectly
    get fun test(): Int {
       return self.callF();
    }
}
