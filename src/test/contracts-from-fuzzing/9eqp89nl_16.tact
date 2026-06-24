message MsBounced {}

contract ReceiverTest {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Internal message receiver
    receive("test") {
        self.counter += 1;
    }

    // Bounced message receiver
    bounced(src: bounced<MsBounced>) {
        self.counter = 100;
    }

    // External message receiver
    external("ext") {
        self.counter = 200;
    }
}

fun main() {
    // Just ensure the contract compiles
    return;
}
