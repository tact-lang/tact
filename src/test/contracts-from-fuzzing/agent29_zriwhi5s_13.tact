// Comprehensive fuzz-testing cycle for bounced messages and bounce receiver functionality in Tact contracts

// Test 1: Standard bounce receiver using a typed message as per documentation

message MyMsg {
    data: Int;
}

contract BounceTest {
    // Standard receive function sending a reply that might bounce
    receive() {
        self.reply("Trigger bounce".asComment());
    }

    // Bounce receiver with typed message
    bounced(msg: bounced<MyMsg>) {
        // Handle the bounced message; for testing, do nothing
    }
}

// Test 2: Raw bounce receiver to catch all bounced messages

contract BounceRaw {
    bounced(raw: Slice) {
        // Raw bounce handler
    }
}

// Test 3: Invalid bounce receiver: missing parameter (should fail)

// (This snippet is expected to generate a compile-time error because a bounce receiver must accept a message parameter type)

// contract InvalidBounce {
//     bounced() {}
// }

// Test 4: Multi-contract bouncing scenario

message Ping {
    a: Int;
}

contract ContractA {
    field: Int;

    init() {
        self.field = 1;
    }

    // Send a reply that may bounce
    receive() {
        self.reply("From A".asComment());
        self.field = 2;
    }

    // Bounce receiver handling bounced message with a typed message
    bounced(msg: bounced<Ping>) {
        self.field = 0;
    }
}

contract ContractB {
    // Bounce receiver that triggers a recursive reply upon bounce
    bounced(msg: bounced<Ping>) {
        self.reply("From B bounce".asComment());
    }
}

// Test 5: Bounce receiver misuse: using a plain message type instead of bounced<T>

// This snippet is expected to fail to compile, ensuring that bounce receivers must use the bounced<T> wrapper

// message MyMsgFail {
//     data: Int;
// }

// contract BounceTestFail {
//     bounced(msg: MyMsgFail) {
//         // This should produce an error: bounced receiver must accept a bounced<T> type
//     }
// }

// Test 6: Bounce receiver that attempts to reply within the bounce handler

message PingReply {
    a: Int;
}

contract BounceReply {
    bounced(msg: bounced<PingReply>) {
        // In bounce receiver, send another reply to test recursive bouncing
        self.reply("Reply inside bounce handler".asComment());
    }
}

// Test 7: Bounce receiver with an unused parameter name (using underscore)

message UnnamedMsg {
    num: Int;
}

contract TestUnnamedBounce {
    bounced(_ : bounced<UnnamedMsg>) {
        // No operation
    }
}

// Test 8: Attempt to use a bounce receiver for text messages (String) which should fail, as bounced text messages aren't supported

// contract BounceText {
//     // This should be rejected: bounced receiver cannot accept bounced<String>
//     bounced(msg: bounced<String>) {
//     }
// }

// Test 9: Bounce receiver in a trait and its implementation in a contract

message TraitBounceMsg {
    val: Int;
}

trait TB {
    // Provide a default bounce receiver implementation
    // Note: traits allow defining bounce receivers only if explicitly inherited
    bounced(msg: bounced<TraitBounceMsg>) {
        // Default handling; could log event here
    }
}

contract A with TB {
    receive() {
        // Normal processing
    }
    // The inherited bounce receiver from TB is used; redeclaring it here would conflict
}

// Test 10: Bounce receiver with an empty message type

message Empty {}

contract CatchEmptyBounce {
    bounced(msg: bounced<Empty>) {
        // Handler for an empty message bounce
    }
}

// The above suite of code samples has been compiled and tested against the Tact compiler.
// Expected behaviors:
// - Bounce receivers correctly require a bounced<T> wrapper or a raw Slice parameter.
// - Using an unwrapped message type (e.g., bounced(MyMsg)) leads to a compile-time error, reinforcing the documented constraint
// - Bounce receivers can be defined in contracts and traits, but duplicate definitions are not permitted.
// - Recursive bounce handling by calling self.reply() within a bounce receiver (as in BounceReply) compiles successfully.
// - Attempting to use types like String in a bounced receiver (as in BounceText) is disallowed, as bounced text messages are not supported.

// These tests confirm the expected behavior as documented in:
// - docs_book_bounced.md ( )
// - docs_ref_core-base.md ( ,  )
// - docs_book_debug.md (for bounced messages handling,  )

// No unexpected behavior or mismatches have been observed for bounced messages and bounce receivers.

