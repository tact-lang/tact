contract DummyRecipient() {}

contract MessageTester() {
    receive() {
        // Test message() function: send a message to a dummy address
        message(MessageParameters{
            to: address("EQDtFpEwcFAEcRe5mLVh2N6C0x-_hJEM7W61_JLnSF74p4q2"),
            value: 0,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: "test message".asComment()
        });
        // Use cashback() to handle remaining balance
        cashback(sender());
    }
}
