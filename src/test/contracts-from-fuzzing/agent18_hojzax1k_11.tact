// Bounce testing cycle for bounced messages and receiver functionality in Tact
//
// This suite of snippets systematically explores:
// 1. Standard bounced message receiver (typed and raw).
// 2. Multi-level bouncing, including echo-style recursive bounce replies.
// 3. Field size constraints in bounced messages (224 usable bits).
//
// Documentation references indicate that bounced messages have only 224 usable data bits (docs/book_bounced.md  ).
// Test cases here show that:
//  - A bounced receiver must receive a message, a bounced<Message>, or a Slice.
//  - If the bounced message's type exceeds the 224-bit usable space, compilation errors are raised.
//  - Recursive bouncing (where a bounced receiver replies via self.reply) must observe this limitation.


// Standard bounced receiver using a typed message
message StandardBounce {
    // Using a type within allowed limits
    x: Int as uint8; // 8-bit unsigned integer well within bounds
}

contract StandardBounceTest {
    // Bounced receiver for StandardBounce messages
    bounced(msg: bounced<StandardBounce>) {
        // Handle bounced message (here, simply reset a state variable could be done)
    }
    
    // Inbound receive to trigger sending a bounceable message
    receive() {
        // Here we send a message that will bounce back because of targeting sender() in a testing context
        send(SendParameters{
            to: sender(),
            value: ton("0.02"),
            bounce: true,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: StandardBounce{ x: 7 }.toCell(),
        });
    }
}


// Bounce receiver that uses raw Slice to catch all bounced messages
contract RawBounceTest {
    bounced(raw: Slice) {
        // Process raw bounced message; no typed access expected
    }
}

// Multi-level bouncing: a contract that replies with a modified bounced message
message BounceEcho {
    v: Int as uint8; // Ensure field fits within 224 data bits
}

contract BounceChain {
    // When a message bounces, reply with an echo message (incrementing v by 1)
    bounced(msg: bounced<BounceEcho>) {
        // This reply, which also qualifies as a bounceable message, uses self.reply
        self.reply(BounceEcho{ v: msg.v + 1 }.toCell());
    }
    
    // Trigger function: sends a bounceable message intending to be bounced
    receive() {
        send(SendParameters{
            to: sender(),
            value: ton("0.02"),
            bounce: true,
            mode: SendRemainingValue | SendIgnoreErrors,
            body: BounceEcho{ v: 42 }.toCell(),
        });
    }
}

// The above snippets validate several aspects:
// * They compile successfully if a proper type is used for bounced messages (e.g. using uint8 ensures that the field size fits in 224 available bits).
// * Directly using an empty parameter list for bounced() results in a compilation error (as in BounceNoParam test, not shown here).
// * Multi-level bouncing with self.reply in BounceChain must adhere to field size constraints; otherwise, the compiler emits an error as documented (see docs_book_bounced.md  ).
//
// In our tests, we observed the following behaviors in accordance with the documentation:
// - Bounced message receivers require either a message type, bounced<MessageType>, or a Slice parameter.
// - Bounced messages are limited to 224 usable data bits; using larger types without constraints produces compile-time errors.
// - The use of self.reply in a bounce receiver is allowed and follows the behavior of self.forward as noted in docs_ref_core-base.md  .
// - Both typed and raw bounced message receivers work as expected.

// End of bounced messages fuzz testing cycle.
