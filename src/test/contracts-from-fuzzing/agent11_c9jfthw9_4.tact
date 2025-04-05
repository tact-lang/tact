contract TestCashback() {
    receive() {
        // Test the cashback() function: it queues an empty message with SendRemainingValue and SendIgnoreErrors
        cashback(sender());
    }
}
