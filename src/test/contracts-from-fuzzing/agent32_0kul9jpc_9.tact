///////////////////////////////////////////
// Comprehensive Bounce Receiver and Bounced Message Testing
///////////////////////////////////////////

// Message type for bounced messages
message PingMsg {
    a: Int;
}

///////////////////////////////////////////
// Contract: BounceReceiver
// This contract demonstrates a valid bounce receiver that handles bounced messages
// by triggering a non-bounce notification using self.notify.
///////////////////////////////////////////

contract BounceReceiver {
    receive() {
        // Accept incoming message normally
        // For testing, simply do nothing
    }

    bounced(msg: bounced<PingMsg>) {
        // When a bounced message is received, respond with a notification
        self.notify("Bounce received".asComment());
    }
}

///////////////////////////////////////////
// Contract: BounceSender
// This contract sends a message to a target contract with bounce enabled.
// It also defines its own bounce receiver to handle bounced messages.
///////////////////////////////////////////

contract BounceSender {
    target: Address;

    init(target: Address) {
        self.target = target;
    }

    external("trigger") {
        // Send a message to the target contract with bounce flag enabled
        send(SendParameters{
            to: self.target,
            value: ton("1"),
            bounce: true,
            mode: 0,
            body: PingMsg{a: 10}.toCell()
        });
    }

    bounced(msg: bounced<PingMsg>) {
        // Handle bounced message; for testing, simply accept without further action
    }
}
