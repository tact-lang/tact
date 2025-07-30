contract TestSendBalance {
    receive() {
        // Test send() with a combination of SendRemainingBalance and SendDestroyIfZero
        // This queues a message which attempts to send the entire balance and destroy the contract if its balance becomes zero
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingBalance | SendDestroyIfZero,
            bounce: true,
            body: "Destroy test".asComment()
        });
        
        // Additionally, use cashback() to forward any remaining value
        cashback(sender());
    }
}

// Dummy contract to ensure TestSendBalance receiver compiles
contract DummyReceiver {
    receive() {
        cashback(sender());
    }
}
