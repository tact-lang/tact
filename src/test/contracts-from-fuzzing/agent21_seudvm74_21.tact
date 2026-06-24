message Divider {
    dummy: Int as uint8;
}

contract NestedTryCatchTest2 {
    state: Int as uint32;

    init() {
        self.state = 0;
    }

    receive(msg: Divider) {
        // This receiver will compute using msg.dummy. For msg.dummy == 1, (msg.dummy - 1) is 0, causing division by zero
        try {
            let a: Int = 42 / (msg.dummy - 1);
        } catch (outerErr) {
            try {
                // Now, log(1000, base) with base = msg.dummy - 1 equals 0, which is invalid
                let b: Int = log(1000, msg.dummy - 1);
                self.state = b; // Just in case (unlikely)
            } catch (innerErr) {
                // If both operations fail, capture the inner error code
                self.state = innerErr;
            }
        }
    }
}
