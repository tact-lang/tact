trait WildTrait {
    // Using wildcards for parameter names
    virtual fun assure(_: Int, _: Int): Bool {
        return true;
    }
}

contract WildContract() with WildTrait {
    // Overriding with concrete parameter names
    override fun assure(a: Int, b: Int): Bool {
        return a + b == b + a;
    }
    
    receive() {
        let result = self.assure(10, 20); // expected true
        if (result) {
            reply("true");
        } else {
            reply("false");
        }
    }
}

inline fun reply(str: String) {
    message(MessageParameters {
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment(),
    });
}
