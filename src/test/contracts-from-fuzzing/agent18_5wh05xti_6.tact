contract DepA {
    init() {
        // No initialization logic
    }

    receive() {
        // Simple receiver
    }
}

contract DepB {
    aAddr: Address;

    init(aAddr: Address) {
        self.aAddr = aAddr;
    }

    receive() {
        // Check relationship: compare stored address with message sender
        if (sender() == self.aAddr) {
            // Do something if sender matches
            // For test purposes, just assign a dummy variable
            let x: Int = 1;
        } else {
            let y: Int = 0;
        }
    }
}
