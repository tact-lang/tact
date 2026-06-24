contract TestNonConstMode() {
    receive() {
        // Define a non-constant computed mode
        let m = SendRemainingValue | SendIgnoreErrors;
        // Attempt to use a non-literal mode value
        send(SendParameters{
            to: sender(),
            value: ton("1"),
            mode: m,
            body: "Test non-const mode".asComment(),
            bounce: true
        });
    }
}
