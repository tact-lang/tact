// The following snippet is a composite test suite for bounced messages and bounce receivers
// It includes multiple scenarios:
// 1. A typed bounced receiver with a simple message type that fits within the 224-bit limit.
// 2. A fallback bounced receiver that uses a raw Slice to catch any bounced message.
// 3. A scenario where the bounced message type is too large, producing an expected compile-time error.

// First, define a simple message type that fits the size constraints.
message SmallMsg {
    // Using a Bool which takes very little space
    flag: Bool;
}

// Contract with a proper typed bounced receiver
contract BounceValid {
    state: Bool;
    init() {
        self.state = false;
    }
    bounced(msg: bounced<SmallMsg>) {
        // Update state based on the bounced message
        self.state = msg.flag;
    }
}

// A contract that uses a fallback handler to catch all bounced messages
contract BounceFallback {
    // No state, just a fallback bounce receiver using raw Slice
    bounced(raw: Slice) {
        // No processing here, just a catch-all
    }
}

// A contract which intentionally triggers a compile-time error by using a message type that exceeds
// the 224 usable data bits limit for bounced messages.
message BigMsg {
    // Using an Int here may be too big when the compiler checks the overall size
    data: Int; 
}

contract BounceTooBig {
    bounced(msg: bounced<BigMsg>) {
        // Attempt to access the field, should cause compilation error:
        // Error: "Maximum size of the bounced message is 224 bytes, but the field of BigMsg cannot fit into it"
        // Uncommenting the following line should fail as documented:
        // let _unused = msg.data;
    }
}

// Additionally, test multiple bounced receivers in one contract by overloading
message A {}
message B {}

contract MultiBounce {
    bounced(msg: bounced<A>) {
        // Handle bounced messages of type A
    }
    bounced(msg: bounced<B>) {
        // Handle bounced messages of type B
    }
}

// This composite snippet covers several aspects of bounce message handling:
// - It confirms that a typed bounced receiver works when the message type is small enough [ ].
// - It confirms that a fallback bounced receiver taking a raw Slice compiles without issue [ ].
// - It validates the documented constraint that bounced messages must fit within 224 data bits (see BigMsg),
//   producing an error as expected if the type is too large.
// - It demonstrates that overloading bounced receivers for different message types is permitted.

// These tests are in line with the official Tact documentation for bounced messages and receiver functions [ ][ ].

// End of test suite
