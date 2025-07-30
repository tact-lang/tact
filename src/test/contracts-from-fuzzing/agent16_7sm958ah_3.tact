trait A {
    // A virtual function with default implementation
    virtual fun foo(a: Int): Int {
        return a + 1;
    }
    
    // An abstract constant that must be overridden
    abstract const ConstA: Int;
}

trait B with A {
    // Override the virtual function from A
    override fun foo(a: Int): Int {
        return a * 2;
    }
    
    // Provide implementation for the abstract constant
    override const ConstA: Int = 100;
    
    // A virtual constant that can be optionally overridden
    virtual const ConstB: Int = 200;
}

contract C() with B {
    // Further override foo in contract C
    override fun foo(a: Int): Int {
        return a * 3;
    }
    
    // Override the virtual constant from trait B
    override const ConstB: Int = 300;
    
    receive() {
        // Use the trait functions and constants via the self reference
        let x = self.foo(2);    // Expected: 2 * 3 = 6
        let a = self.ConstA;      // Expected: 100
        let b = self.ConstB;      // Expected: 300
        
        require(x == 6, "Unexpected foo result");
        require(a == 100, "Unexpected ConstA value");
        require(b == 300, "Unexpected ConstB value");
        
        reply("layered done");
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
