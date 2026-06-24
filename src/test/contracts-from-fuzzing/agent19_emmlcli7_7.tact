trait ChainTrait {
    // f() calls virtual g() and adds 1
    virtual fun f(): Int { return self.g() + 1; }
    // Default implementation of g()
    virtual fun g(): Int { return 10; }
}

contract ChainTest() with ChainTrait {
    // Override g() to return 20
    override fun g(): Int { return 20; }

    // Receiver function to test trait chaining behavior
    // When receiving "chain", self.f() should compute: g() overridden = 20, so f() returns 20 + 1 = 21
    receive("chain") {
         let res = self.f();
         reply(res.toString());
    }
}

// Helper inline function to send a reply message
inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
