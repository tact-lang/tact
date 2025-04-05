trait A {
    // Virtual function that returns the value of the virtual constant getConst
    virtual fun foo(): Int {
        return self.getConst;
    }

    // Virtual constant with default value 5
    virtual const getConst: Int = 5;
}

// Trait B inherits from A and overrides the virtual constant
trait B with A {
    override const getConst: Int = 10;
}

// A contract that implements trait B
contract Test1() with B {
    receive() {
        let result = self.foo(); // expected result is 10
        reply(result.toString());
    }
}

// Global inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
