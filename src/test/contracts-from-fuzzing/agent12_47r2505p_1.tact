trait TraitConst {
    // Virtual constant with a default value
    virtual const C: Int = 10;
}

contract TestConst() with TraitConst {
    // Override the virtual constant with a new value
    override const C: Int = 20;

    // Receiver that uses the constant and sends its string representation
    receive() {
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            bounce: false,
            body: self.C.toString().asComment()
        });
    }
}
