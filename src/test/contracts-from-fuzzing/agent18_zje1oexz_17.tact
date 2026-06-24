contract TestOpsPrecedence {
    receive() {
        // Using explicit parentheses to force different precedence
        // In Tact, based on documentation, operators have standard precedence rules.
        // Here we calculate two values:
        // a = 5 << (2 + 3)   which should be 5 << 5 = 160,
        // b = (5 << 2) + 3   which should be (5 << 2) = 20, plus 3 = 23.
        // The difference should be 160 - 23 = 137.
        let a: Int = 5 << (2 + 3);
        let b: Int = (5 << 2) + 3;
        let diff: Int = a - b;
        reply(diff.toString());
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
