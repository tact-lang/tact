trait T {
    // Abstract function, must be implemented by the contract
    abstract fun f(): Int;
    
    // Virtual function with default implementation
    virtual fun g(): Int { return 42; }
    
    // Abstract constant, must be overridden
    abstract const overrideMe: Int;
    
    // Virtual constant which can be optionally overridden
    virtual const youCanOverrideMe: Int = 1;
}

contract Test() with T {
    // Override the abstract function
    override fun f(): Int { return 99; }
    
    // Override the abstract constant
    override const overrideMe: Int = 100;
    
    // Override the virtual constant
    override const youCanOverrideMe: Int = 123;
    
    // A receiver function to test trait behavior
    receive() {
        // Use self.f() and self.youCanOverrideMe instead of bare names
        let r = self.f() + self.youCanOverrideMe; // 99 + 123 = 222
        require(r == 222, "Mismatch");
        reply("ok");
    }
}

// A helper inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
