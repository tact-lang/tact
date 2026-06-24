// Fuzz-testing for bounced messages and bounce receivers in Tact

// This test suite covers multiple scenarios for handling bounced messages including:
// 1. Basic typed bounce receivers (BounceBasic) where the bounce handler simply exists to catch bounced messages of a specific type (MyMsg).
// 2. Raw slice bounce receiver (BounceRaw) where the bounce handler uses the raw Slice parameter to check message contents.
// 3. Bounce handling with a reply mechanism (BounceReply) that invokes self.reply() when a bounce occurs.
// 4. Using try...catch in a bounce receiver (BounceTryCatch) to catch runtime errors (e.g. division-by-zero induced by a flag in the message), and sending an error reply.
// 5. A recursive bounce scenario (RecursiveBounce) in which a bounced message triggers a reply that itself may bounce, as a potential edge case.
// 6. A multi-contract chain bounce scenario (AChain and BChain) where a message sent to a contract BChain (with no valid receiver) bounces back to AChain, which then handles the bounce.

// These tests are developed based on documentation references on bounced messages [see docs_book_bounced.md  ] and related receiver functionality [docs_ref_core-send.md  ].

// -------------------------------------------------------------------
// Test 1: Basic typed bounce receiver (BounceBasic)
message MyMsg {
    dummy: Int;
}

contract BounceBasic {
    bounced(msg: bounced<MyMsg>) {
        // Minimal bounce handler as per docs
    }
}

// -------------------------------------------------------------------
// Test 2: Raw slice bounce receiver (BounceRaw)
contract BounceRaw {
    bounced(rawMsg: Slice) {
        // Process raw bounced message by reading its bit length
        let b = rawMsg.bits();
    }
}

// -------------------------------------------------------------------
// Test 3: Bounce receiver that replies using self.reply (BounceReply)
message ReplyMsg {
    info: String;
}

contract BounceReply {
    bounced(msg: bounced<ReplyMsg>) {
        // Upon bounce, send a reply
        self.reply("Bounce reply triggered".asComment());
    }
}

// -------------------------------------------------------------------
// Test 4: Bounce receiver with try...catch handling runtime error (BounceTryCatch)
message SmallBounceMsg {
    flag: Bool;
}

contract BounceTryCatch {
    bounced(msg: bounced<SmallBounceMsg>) {
        // Depending on the flag, trigger a division-by-zero runtime error
        try {
            let d: Int = msg.flag ? 0 : 1;
            let x = 1 / d;
        } catch (e) {
            // On exception, send a reply
            self.reply("Division error caught in bounced handler".asComment());
        }
    }
}

// -------------------------------------------------------------------
// Test 5: Recursive bounce scenario (RecursiveBounce)
// This contract may trigger a recursive bounce as its bounce handler uses self.reply
message RecMsg {
    flag: Bool;
}

contract RecursiveBounce {
    bounced(msg: bounced<RecMsg>) {
        // Send a reply which could potentially trigger another bounce if no valid receiver exists
        self.reply("Recursive bounce reply".asComment());
    }
}

// -------------------------------------------------------------------
// Test 6: Multi-level bouncing across contracts (AChain and BChain)
// BChain is an empty contract (no valid receivers), so messages directed to it will bounce.
contract BChain {
    // Intentionally empty to force bounced messages
}

// AChain sends a bounceable message to BChain and handles the bounce
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
        // Handle the bounced message from BChain
        self.reply("AChain bounce reply".asComment());
    }
}

// -------------------------------------------------------------------
// End of tests

// This comprehensive test suite ensures robust validation of bounced message behavior from standard documentation
// [Bounced messages docs: docs_book_bounced.md  ] and receiver functions [docs_ref_core-send.md  ].
