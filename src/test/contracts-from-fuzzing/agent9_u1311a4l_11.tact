message BounceMsg {
    val: Int;
}

contract Receiver {
    // This contract does not have any receiver defined, so messages sent to it will bounce
}

contract Sender {
    counter: Int;

    init() {
        self.counter = 0;
    }

    // Bounce receiver: handles bounced messages of type BounceMsg
    bounced(msg: bounced<BounceMsg>) {
        // For example, increment a counter when a bounced message is received
        self.counter = self.counter + 1;
    }

    fun sendMsg(receiver: Address) {
        send(SendParameters{
            to: receiver,
            bounce: true,
            value: 0,
            mode: 0,
            body: BounceMsg{val: 42}.toCell()
        });
    }
}
