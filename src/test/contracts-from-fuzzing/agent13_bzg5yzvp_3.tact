trait T {
    // Abstract function: must be implemented by the contract
    abstract fun foo(x: Int): Int;

    // Virtual function: default implementation provided, can be overridden
    virtual fun bar(x: Int): Int {
         return x + 1;
    }

    // Abstract constant: must be defined in the contract
    abstract const overrideA: Int;
    
    // Virtual constant: default value provided, can be overridden
    virtual const virtA: Int = 100;
}

contract Test() with T {
    // Override abstract function
    override fun foo(x: Int): Int {
         return x * 2;
    }
    
    // Override virtual function
    override fun bar(x: Int): Int {
         return x + 10;
    }
    
    // Override abstract constant
    override const overrideA: Int = 42;
    
    // Override virtual constant
    override const virtA: Int = 200;

    receive() {
         // Use self to access the trait methods and constants
         let a = self.foo(3);      // Expected: 6
         let b = self.bar(3);      // Expected: 13
         let c = self.overrideA;   // Expected: 42
         let d = self.virtA;       // Expected: 200

         // Instead of passing a cell to reply, pass a string literal
         reply("OK");
    }
}

// Helper inlined function to send a message reply
inline fun reply(str: String) {
    message(MessageParameters{
       to: sender(),
       value: 0,
       mode: SendRemainingValue | SendIgnoreErrors,
       body: str.asComment()
    });
}
