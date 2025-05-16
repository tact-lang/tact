trait MyTrait {
    // An abstract function that must be implemented by inheriting contracts
    abstract fun foo(): Int;
    
    // A virtual function with a default implementation
    virtual fun bar(): Int {
        return 5;
    }
}

contract TestContract() with MyTrait {
    // Override the abstract function
    override fun foo(): Int {
        return 7;
    }
    
    // Override the virtual function to use self.foo()
    override fun bar(): Int {
        return self.foo() * 3;
    }
    
    // The receiver function invokes the trait functions
    receive() {
        let result = self.bar();
        // Expecting bar() to be 7 * 3 = 21
        require(result == 21, "Result should be 21");
        reply("OK");
    }
}

// A helper inline function to simulate message sending
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
