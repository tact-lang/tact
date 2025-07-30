trait TraitA {
    // Abstract function to be implemented by inheriting contract
    abstract fun foo(): Int;
    
    // Virtual constant that can be overridden
    virtual const constA: Int = 10;
    
    // Virtual function that uses the abstract function and the constant
    virtual fun bar(): Int {
         return self.foo() + self.constA;
    }
}

contract ContractX() with TraitA {
    // Override the abstract function
    override fun foo(): Int {
         return 20;
    }
    
    // Override the virtual constant
    override const constA: Int = 30;
    
    receive() {
         // Calculate the result using bar(): expected 20 + 30 = 50
         let res = self.bar();
         reply(res.toString());
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
