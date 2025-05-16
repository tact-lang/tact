trait A {
    // Virtual constant with default value
    virtual const x: Int = 10;
}

trait B {
    // Virtual constant with default value
    virtual const y: Int = 100;
}

contract C() with A, B {
    // Override the virtual constants from both traits
    override const x: Int = 20;
    override const y: Int = 200;
    
    receive() {
        // Test that the overridden values are used
        let s = self.x + self.y; // expected: 20 + 200 = 220
        require(s == 220, "fail");
        reply("ok");
    }
}

// Inline helper function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
