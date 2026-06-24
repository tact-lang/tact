trait X {
    // Abstract function: must be defined by inheritors
    abstract fun foo(): Int;
    
    // Virtual function with a default implementation
    virtual fun bar(): Int { return 1; }
    
    // Abstract constant: must be provided by inheritors
    abstract const CX: Int;
    
    // Virtual constant with default value
    virtual const CY: Int = 2;
}

// Trait Y inherits from X and provides overrides for abstract members
trait Y with X {
    // Override abstract function foo with a definition that uses CX
    override fun foo(): Int { return self.CX + 10; }
    
    // Override virtual function bar
    override fun bar(): Int { return 100; }
    
    // Provide definition for abstract constant CX
    override const CX: Int = 5;
    
    // Override virtual constant CY with a new default
    override const CY: Int = 20;
}

// Contract Z uses trait Y and further customizes behavior
contract Z() with Y {
    // Further override foo() if desired; here we'll use our own definition
    // to combine CX and the result of bar()
    override fun foo(): Int { return self.CX + self.bar(); }  // Expected: 5 + 100 = 105

    // A test function that sums foo() and constant CY
    fun test(): Int { return self.foo() + self.CY; }  // Expected: 105 + 20 = 125

    receive() {
        let res = self.test();
        reply(res.toString());
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
