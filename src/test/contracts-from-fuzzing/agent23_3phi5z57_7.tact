message Ping {
    text: String;
}

contract CounterBounce {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Bounce receiver: increments counter on bounced message
    bounced(msg: bounced<Ping>) {
        self.counter = self.counter + 1;
    }

    // A normal receive function to trigger bounce for testing
    receive() {
        // Force bounce by using reply
        self.reply("Bounce test".asComment());
    }

    // Getter for testing counter value
    get fun getCounter(): Int {
        return self.counter;
    }
}
