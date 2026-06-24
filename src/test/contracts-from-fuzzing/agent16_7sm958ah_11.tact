extends mutates fun inc(self: Int) {
    self += 1;
}

contract TestMutate {
    receive() {
        let x: Int = 10;
        x.inc();
        require(x == 11, "inc failed");
        reply("inc works");
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
