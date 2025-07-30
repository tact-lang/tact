trait TraitConst {
    // Virtual constant with default value
    virtual const A: Int = 5;
    // Abstract constant, required to be overridden
    abstract const B: Int;
}

contract TestConst() with TraitConst {
    // Override the virtual constant
    override const A: Int = 10;
    // Provide definition for the abstract constant
    override const B: Int = 20;
    
    receive() {
        let sum = self.A + self.B; // Expected: 10 + 20 = 30
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: sum.toString().asComment(),
        });
    }
}
