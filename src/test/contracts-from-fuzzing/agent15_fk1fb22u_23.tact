contract TestContract {
    receive() {
        let invalidBase64 = "????";
        let decoded = invalidBase64.fromBase64();
    }
}
