contract ForwardTest {

    // Override self.storageReserve with a non-default value
    override const storageReserve: Int = ton("0.05");
    
    // Directly test the self.forward() call
    receive() {
        // Forward a message with a sample comment body, bounce enabled, and no init package
        self.forward(sender(), "test message".asComment(), true, null);
        cashback(sender());
    }
}
