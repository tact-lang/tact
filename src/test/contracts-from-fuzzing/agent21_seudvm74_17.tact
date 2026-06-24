message MyMsg { dummy: Int as uint32; }

contract TryCatchTest {
    // Persistent state variable to store the caught error code
    caught: Int as uint32;

    init() {
        self.caught = 0;
    }

    // Bounced message receiver which attempts a division that will cause a runtime error
    bounced(msg: bounced<MyMsg>) {
        try {
            // This expression is not constant because it depends on the runtime value of msg.dummy
            // If msg.dummy is 1, then 42 / (msg.dummy - 1) causes division by zero
            let x: Int = 42 / (msg.dummy - 1);
            // If no error, assign a dummy value (should not occur in our test)
            self.caught = 999;
        } catch (err) {
            // Capture the error code (expected to be 4: Integer overflow/division by zero error as per docs)
            self.caught = err;
        }
    }
}
