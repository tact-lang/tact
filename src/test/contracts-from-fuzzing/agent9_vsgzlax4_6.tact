/// Advanced test for abstract and virtual function dependency in traits

// Trait P defines a virtual function 'foo' that uses an abstract function 'bar'
trait P {
    // Virtual function 'foo' that takes an integer and returns the sum of that integer and the result of bar()
    virtual fun foo(x: Int): Int {
        return x + self.bar();
    }
    
    // Abstract function 'bar' that must be implemented by inheriting contracts
    abstract fun bar(): Int;
}

// Contract S implements trait P by overriding the abstract function 'bar'
contract S() with P {
    // Provide implementation for bar() returning a constant value
    override fun bar(): Int {
        return 42;
    }
    
    // Receiver to test the function call: foo(10) should yield 10 + 42 = 52
    receive() {
        let res = self.foo(10);
        reply(res.toString());
        cashback(sender());
    }
}

// Inline helper function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters {
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}

// Dummy contract to ensure file is non-empty
contract Dummy {}
