message Empty {}

contract BounceLimiter {
    target: Address;
    counter: Int = 0;

    init(target: Address) {
        self.target = target;
    }

    fun loop() {
        if (self.counter < 3) {
            // Send bounceable Empty message to the target
            self.forward(self.target, Empty{}.toCell(), true, null);
        }
    }

    bounced(msg: bounced<Empty>) {
        self.counter += 1;
        self.loop();
    }

    fun startChain() {
        self.loop();
    }
}
