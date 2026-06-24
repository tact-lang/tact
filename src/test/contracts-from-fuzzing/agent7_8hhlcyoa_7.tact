message Ping {
    value: Int as uint64;
}

message BounceMsg {
    value: Int as uint64;
}

contract ReceiverFail {
    // This contract's receive function always fails to trigger a bounce
    receive("ping") {
        require(false, "Always fail");
    }
}

contract SenderBounce {
    state: Int;

    init() {
        self.state = 0;
    }

    // bounced receiver that should be invoked when an outgoing message bounces back
    bounced(msg: bounced<BounceMsg>) {
        // Assign the bounced message value to state
        self.state = msg.value;
    }

    // A public function to send a ping message with bounce enabled
    fun sendPing(to: Address) {
        send(SendParameters{
            to: to,
            value: ton("1"),
            mode: 0,
            bounce: true,
            body: Ping{value: 42}.toCell()
        });
    }
}
