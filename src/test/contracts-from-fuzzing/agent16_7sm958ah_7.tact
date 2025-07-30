trait A {
    virtual fun f(): Int {
        return 2;
    }
    
    virtual fun g(): Int {
        return self.f() * 2;
    }
}

contract C() with A {
    override fun f(): Int {
        return 3;
    }
    
    receive() {
        let result = self.g(); // expected: 3 * 2 = 6
        require(result == 6, "g() error");
        reply("inheritance chain ok");
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
