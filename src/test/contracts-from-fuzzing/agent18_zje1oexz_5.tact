trait TraitTest {
    // Abstract function: must be overridden
    abstract fun f(x: Int): Int;
    
    // Virtual function: has default implementation but can be overridden
    virtual fun g(x: Int): Int {
        return x + 1;
    }

    // Abstract trait-level constant: must be overridden
    abstract const constA: Int;
    
    // Virtual trait-level constant: can be overridden
    virtual const constB: Int = 42;
}

contract TestContract(initValue: Int) with TraitTest {
    // Override abstract function f
    override fun f(x: Int): Int {
        return x * 2;
    }
    
    // Override virtual function g
    override fun g(x: Int): Int {
        // Access the virtual constant via self
        return x + self.constB;
    }
    
    // Override the abstract constant constA
    override const constA: Int = ton("0.5");
    
    // Override the virtual constant constB
    override const constB: Int = 100;

    // A helper function to test trait functions and constants
    fun test(): Int {
        let a = self.f(self.initValue);    // expected: self.initValue * 2
        let b = self.g(self.initValue);      // expected: self.initValue + 100
        return a + b;                        // total = 2*initValue + initValue + 100
    }

    // The contract receiver that calls test() when a message arrives
    receive() {
        let res = self.test();
        // Send the result back as a text message
        reply(res.toString());
    }
}

// Global inline function to send reply messages
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
