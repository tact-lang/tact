trait A {
    // Virtual function: adds x to the result of aux()
    virtual fun calc(x: Int): Int {
        return x + self.aux();
    }
    
    // Virtual function that returns a value, default is 1
    virtual fun aux(): Int {
        return 1;
    }
}

// Trait B inherits from A and overrides aux() to return 3
trait B with A {
    override fun aux(): Int {
        return 3;
    }
}

// Contract C implements trait B
contract C() with B {
    // A simple receiver that calculates self.calc(2) and replies with the result
    receive() {
        // Expected: calc(2) = 2 + aux(), and aux() is overriden to return 3, so result = 5
        let r = self.calc(2);
        reply(r.toString());
        cashback(sender());
    }
}

// Inline helper function to send a reply as a message
inline fun reply(str: String) {
    message(MessageParameters {
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}

// Dummy contract to prevent empty file
contract Dummy {}
