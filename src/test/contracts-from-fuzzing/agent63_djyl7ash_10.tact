trait A {
    // Virtual constant with default value in trait A
    virtual const X: Int = 100;
}

trait B {
    // Virtual constant with default value in trait B
    virtual const X: Int = 200;
}

contract C() with A, B {
    // To resolve the conflict between traits A and B regarding constant X,
    // we override X in this contract.
    override const X: Int = 300;

    receive() {
        // Test that the overridden constant is correctly used
        let value = self.X;  // should be 300
        require(value == 300, "X mismatch");
        reply("ok");
    }
}

// Helper inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
