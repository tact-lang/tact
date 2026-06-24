contract TestParameterReceiver(x: Int) {
    // Receiver function that references a contract parameter
    receive() {
        // Use self.x to verify the parameter is accessible in a receiver
        let _ = self.x + 1;
    }
}
