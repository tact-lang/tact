trait Trait1 {
    // An abstract function; must be implemented by the contract
    abstract fun compute(): Int;
    
    // A virtual function that uses compute()
    virtual fun result1(): Int {
        return self.compute() + 10;
    }
}

trait Trait2 {
    // A virtual constant that can be overridden
    virtual const k: Int = 5;
    
    // A virtual function that depends on the constant
    virtual fun result2(): Int {
        return self.k * 3;
    }
}

contract Multi() with Trait1, Trait2 {
    // Provide concrete implementation for the abstract function
    override fun compute(): Int {
        return 100;
    }
    
    // Override the virtual constant
    override const k: Int = 7;
    
    receive() {
        // Expected: result1() = 100 + 10 = 110, result2() = 7*3 = 21, sum = 131
        let r = self.result1() + self.result2();
        reply(r.toString());
    }
}

// A helper inlined function to send text messages
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
