message Ping {}
message Pong {}

contract ChainedA {
    counter: Int;
    target: Address;
    
    init(target: Address) {
        self.counter = 0;
        self.target = target;
    }

    // Bounce receiver for bounced<Ping>
    bounced(msg: bounced<Ping>) {
        // Increment counter on bounce
        self.counter += 1;
        // Reply on bounce event
        self.reply("ChainedA bounce Ping received".asComment());
    }

    // receive function that initiates a bounce chain by sending a Ping message
    receive("start") {
        send(SendParameters{
            to: self.target,
            value: 0,
            mode: SendRemainingValue,
            body: Ping{}.toCell()
        });
    }
}

contract ChainedB {
    state: Int;

    init() {
        self.state = 10;
    }

    // Bounce receiver for bounced<Pong>
    bounced(msg: bounced<Pong>) {
        // Modify state on bounce event
        self.state += 5;
        self.notify("ChainedB bounce Pong received".asComment());
    }

    // receive function that responds to 'ping' messages by sending a Pong back
    receive("ping") {
        send(SendParameters{
            to: sender(),
            value: 0,
            mode: SendRemainingValue,
            body: Pong{}.toCell()
        });
    }
}

// A contract that processes all bounced messages in raw form
contract RawBounceHandler {
    bounced(rawMsg: Slice) {
        // Process raw bounced message from any source
    }
}
