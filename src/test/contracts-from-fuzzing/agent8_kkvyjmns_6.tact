trait T1 {
    virtual const X: Int = 100;
}

trait T2 {
    virtual const X: Int = 200;
}

contract D() with T1, T2 {
    // Must override the conflicting virtual constant
    override const X: Int = 300;

    receive() {
        // This receiver forces contract compilation.
        // Expected value of self.X is 300.
        reply(self.X.toString());
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
