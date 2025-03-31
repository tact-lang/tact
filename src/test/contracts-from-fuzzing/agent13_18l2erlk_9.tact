// Tact code tests for bounce receiver functionality

// 1. Standard typed bounce receiver as per documentation:
message StandardMessage {
    value: Int;
}

contract StandardBounceReceiver {
    bounced(msg: bounced<StandardMessage>) {
        // No-op: valid bounce receiver for StandardMessage
    }
}

// 2. Raw bounce receiver accepting all bounced messages in raw format
contract RawBounceReceiver {
    bounced(rawMsg: Slice) {
        // Process the raw Slice
    }
}

// 3. Bounce receiver that ignores the passed message (underscore for unused parameter)
contract IgnoredBounceReceiver {
    bounced(_: bounced<StandardMessage>) {
        // Message ignored
    }
}

// 4. Bounce receiver that modifies state and sends a reply
contract StatefulBounceHandler {
    count: Int;

    init() {
        self.count = 0;
    }

    bounced(msg: bounced<StandardMessage>) {
        // Modify state variable
        self.count += 1;
        // Issue a reply message on bounce event
        self.reply("Bounce processed".asComment());
    }
}

// 5. Multi-contract chained bounce scenario
message Ping {}
message Pong {}

contract ChainSender {
    target: Address;

    init(target: Address) {
        self.target = target;
    }

    // Initiates a message expected to bounce
    receive("initiate") {
        send(SendParameters{
            to: self.target,
            value: 0,
            mode: SendRemainingValue,
            body: Ping{}.toCell()
        });
    }

    bounced(msg: bounced<Ping>) {
        // On bounce event, issue a reply
        self.reply("ChainSender received bounced Ping".asComment());
    }
}

contract ChainResponder {
    bounced(msg: bounced<Pong>) {
        // Process bounced Pong by notifying
        self.notify("ChainResponder received bounced Pong".asComment());
    }

    // When receiving a Ping, respond by sending a Pong, which might bounce back if there is an issue
    receive("ping") {
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: Pong{}.toCell()
        });
    }
}

// 6. Invalid bounce receiver examples to trigger compile errors
// (These are commented out to preserve overall compilation, but they illustrate documented error cases):
/*
contract InvalidBounce1 {
    // Wrong parameter type (not bounced<> or Slice)
    bounced(msg: Int) {
        // Error expected
    }
}

contract InvalidBounce2 {
    // Bounce receiver with no parameters
    bounced() {
        // Error expected
    }
}

contract DuplicateBounceReceiver {
    bounced(msg: bounced<StandardMessage>) {
        // First definition
    }
    bounced(msg: bounced<StandardMessage>) {
        // Error: Duplicate for the same type
    }
}
*/
