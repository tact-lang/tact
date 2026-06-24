trait A {
    virtual const v: Int = 10;
}

trait B {
    virtual const v: Int = 20;
}

contract C() with A, B {
    // Override the conflicting virtual constant from both traits
    override const v: Int = 30;

    receive("test") {
        // Expected: self.v is 30
        let result = self.v;
        message(MessageParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: result.toString().asComment(),
        });
    }
}
