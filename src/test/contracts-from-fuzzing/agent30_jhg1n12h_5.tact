message EmptyMsg {}

contract BounceTestEmpty {
    triggered: Bool;

    init() {
        self.triggered = false;
    }

    // A receiver that sends an outbound bounced message
    receive("trigger") {
        // Using sender() as target; the bounced message is empty
        self.forward(sender(), EmptyMsg{}.toCell(), true, null);
    }

    // Bounced receiver function handling EmptyMsg type messages
    bounced(msg: bounced<EmptyMsg>) {
        self.triggered = true;
    }
}
