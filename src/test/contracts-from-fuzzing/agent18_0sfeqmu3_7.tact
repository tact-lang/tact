trait ConstTrait {
    // Abstract constant: must be provided by implementing contracts
    abstract const a: Int;
    
    // Virtual constant with a default value
    virtual const b: Int = 5;
}

contract C() with ConstTrait {
    // Override the abstract constant
    override const a: Int = 10;
    
    receive("test") {
        // Expected result = a + b = 10 + 5 = 15
        let res = self.a + self.b;
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: res.toString().asComment(),
        });
    }
}
