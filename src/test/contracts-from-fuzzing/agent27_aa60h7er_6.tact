trait T {
    // Abstract function, must be overridden
    abstract fun foo(): Int;
    
    // Virtual function that uses the abstract function
    virtual fun callFoo(): Int { return self.foo() * 2; }
}

contract C() with T {
    // Override the abstract function
    override fun foo(): Int { return 10; }
    
    // A helper function to test trait behavior
    fun test(): Int { return self.callFoo(); }  
    
    receive() {
        let result = self.test();
        reply(result.toString());
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
