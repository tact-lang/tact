///////////////////////////////////////////////////////////////
// Comprehensive fuzz-testing for bounced messages and bounce receiver functionality in Tact
///////////////////////////////////////////////////////////////

// Test 1: Basic typed bounce receiver
message MyMsg {
    dummy: Int;
}

contract BounceBasic {
    bounced(msg: bounced<MyMsg>) {
        // Minimal bounce handler as per documentation
    }
}

// Test 2: Raw slice bounce receiver
contract BounceRaw {
    bounced(rawMsg: Slice) {
        // Process raw bounced message, e.g., read bit length
        let b = rawMsg.bits();
    }
}

// Test 3: Bounce receiver that replies using self.reply
message ReplyMsg {
    info: String;
}

contract BounceReply {
    bounced(msg: bounced<ReplyMsg>) {
        // On bounce, immediately reply
        self.reply("Bounce reply triggered".asComment());
    }
}

// Test 4: Bounce receiver using try...catch to handle a runtime error
message SmallBounceMsg {
    flag: Bool;
}

contract BounceTryCatch {
    bounced(msg: bounced<SmallBounceMsg>) {
        // Depending on the flag, trigger a division-by-zero error at runtime
        try {
            let d: Int = msg.flag ? 0 : 1;
            let x = 1 / d;
        } catch (e) {
            // On error, send a reply
            self.reply("Division error caught in bounced handler".asComment());
        }
    }
}

// Test 5: Recursive bounce scenario within the same contract
// This contract lacks a corresponding receive() for RecMsg, so any reply it sends to itself will bounce.
message RecMsg {
    flag: Bool;
}

contract RecursiveBounce {
    // Bounced handler that calls self.reply, triggering a potential recursive bounce
    bounced(msg: bounced<RecMsg>) {
        self.reply("Recursive bounce reply".asComment());
    }
}

// Test 6: Multi-level (chain) bouncing across two contracts
// Contract BChain acts as the recipient but does not implement any receive() or bounced() handler, so messages sent to it will bounce.
contract BChain {
    // Empty contract intentionally causing bounce of incoming messages
}

// Contract AChain sends a bounceable message to BChain and handles the bounced message
contract AChain {
    b_addr: Address;

    init(b_addr: Address) {
        self.b_addr = b_addr;
    }

    receive() {
        // Send a bounceable message to contract BChain
        send(SendParameters{
            to: self.b_addr,
            value: ton("1"),
            bounce: true,
            mode: SendRemainingValue,
            body: RecMsg{ flag: false }.toCell()
        });
    }

    bounced(msg: bounced<RecMsg>) {
        // Upon bounce from BChain, reply back to the sender
        self.reply("AChain bounce reply".asComment());
    }
}

///////////////////////////////////////////////////////////////
// End of comprehensive bounced messages fuzz-testing snippet
///////////////////////////////////////////////////////////////
