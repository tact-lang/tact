message TestMsg {}

contract RecursiveBounce {
    // State variable holding an address of a contract that will force a bounce
    failAddr: Address;
    bounceCount: Int;

    // Using an empty parameter list; initialization in init() is allowed because the contract has no parameters in the header
    init() {
        // Initialize failAddr with a hardcoded address using the lower-case address() function
        self.failAddr = address("0:0000000000000000000000000000000000000000000000000000000000000000");
        self.bounceCount = 0;
    }

    // Bounce receiver handling bounced messages of type TestMsg
    bounced(msg: bounced<TestMsg>) {
        // Increment the bounce counter when a bounce occurs
        self.bounceCount = self.bounceCount + 1;
        // Trigger a recursive bounce only if bounceCount is below a threshold (e.g., 2) to avoid infinite loops
        if (self.bounceCount < 2) {
            // Forward another TestMsg to the failing address to trigger a subsequent bounce
            self.forward(self.failAddr, TestMsg{}.toCell(), true, null);
        }
    }

    // receive() function that initiates a message sending which is expected to bounce
    receive() {
        // Send a message of type TestMsg to the failing contract address
        self.forward(self.failAddr, TestMsg{}.toCell(), true, null);
    }
}
