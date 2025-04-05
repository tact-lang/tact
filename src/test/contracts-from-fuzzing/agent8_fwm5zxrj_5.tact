contract TestSendBalance {
    receive() {
        // Send out a message with the entire remaining balance
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingBalance | SendIgnoreErrors,
            body: "Remaining balance sent".asComment()
        });
        cashback(sender());
    }
}
