contract TryCatchTest2 {
    receive() {
        try {
            // Throw an error with code 456
            throw(456);
        } catch (code) {
            // Catch the error and send its code as a reply
            reply(code.toString());
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
