contract DoUntilTest {
    receive() {
        let a: Int = 0;
        do {
            a += 3;
        } until (a >= 10);
        reply(a.toString());
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
