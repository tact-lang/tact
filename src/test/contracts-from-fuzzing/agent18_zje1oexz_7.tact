trait WithCounter {
    // Declare a persistent state variable in the trait
    counter: Int;
    
    // Virtual function to increment the counter
    virtual fun inc() {
        self.counter += 1;
    }
}

// Contract C implements the trait WithCounter and initializes the counter via constructor parameter
contract C(counter: Int) with WithCounter {
    // The contract does not override the virtual inc() function
    receive() {
        let old = self.counter;
        self.inc();
        let sum = old + self.counter; // expected: old + (old + 1) = 2*old + 1
        reply(sum.toString());
    }
}

// Global inline function to send reply messages
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
