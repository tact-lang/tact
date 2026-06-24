message MyMsg {
    // Use a smaller integer type that fits within 224 bits
    a: Int as uint8;
}

contract BounceTryCatch {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Bounce receiver using try...catch to handle a division error at runtime
    bounced(msg: bounced<MyMsg>) {
        try {
            // If msg.a is zero, division by zero will be attempted at runtime and caught
            let x = 100 / msg.a;
            self.counter = self.counter + x;
        } catch (err) {
            // In case of an error (for example, if msg.a == 0), increment the counter by 1
            self.counter = self.counter + 1;
        }
    }
}
