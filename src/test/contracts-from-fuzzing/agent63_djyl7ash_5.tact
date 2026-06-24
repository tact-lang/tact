trait T {
    virtual fun g(): Int { return 42; }
}

contract Test2() with T {
    receive() {
        let s = self.g();
        require(s == 42, "fail");
        reply("ok");
    }
}

inline fun reply(str: String) {
    message(MessageParameters{
        to: sender(),
        value: 0,
        mode: SendRemainingValue | SendIgnoreErrors,
        body: str.asComment()
    });
}
