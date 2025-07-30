/*
   Comprehensive fuzz-testing cycle for bounced messages and bounce receiver functionality in Tact contracts.
   This snippet tests various aspects:
   1. A minimal valid bounce receiver using a structured message (MyMessage).
   2. A raw slice bounce receiver (BounceRawHandler).
   3. A multi-contract bounce chain using Ping messages between BounceResponder and BounceInitiator.
   4. A bounce receiver with error handling via try-catch in BounceWithTry.
   5. A commented-out duplicate bounce handler example (should be rejected if uncommented).
   6. A bounce receiver accessing a message with an oversized field (without field access).

   The 8-bit signed integer field is declared using the built-in conversion: "Int as int8".
*/

message MyMessage {
    // Using an 8-bit signed integer to ensure the message payload fits within the 224 usable data bits limit
    value: Int as int8;
}

contract BounceHandler {
    // Standard bounce receiver for bounced<MyMessage>
    bounced(msg: bounced<MyMessage>) {
        // Access the bounced message field and increment it
        let new_val = msg.value + 1;
    }
}

contract BounceRawHandler {
    // Bounce receiver that handles raw bounced message slices
    bounced(rawMsg: Slice) {
        // No processing: raw slice is available for manual handling
    }
}

message Ping {
    counter: Int as int8;
}

contract BounceResponder {
    // This contract forces a bounce by always reverting in its receive function
    receive() {
        require(false, "Forced bounce in BounceResponder");
    }

    bounced(msg: bounced<Ping>) {
        // Bounce receiver; here we simply do nothing upon receiving a bounced Ping
    }
}

contract BounceInitiator {
    // This contract initiates a bounce chain; upon receiving a bounced Ping,
    // it sends a new Ping with an incremented counter
    bounced(msg: bounced<Ping>) {
         send(SendParameters{
            to: address("0:BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: Ping{ counter: msg.counter + 1 }.toCell()
         });
    }
    
    // The receive function starts the bounce chain by sending an initial Ping message
    receive() {
         send(SendParameters{
            to: address("0:BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB"),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            body: Ping{ counter: 1 }.toCell()
         });
    }
}

message SimpleMsg {
    flag: Bool;
}

contract BounceWithTry {
    balance: Int;
    
    init() {
        self.balance = 0;
    }

    bounced(msg: bounced<SimpleMsg>) {
        // Demonstrates try-catch inside a bounce receiver
        try {
            // Force an error intentionally
            require(false, "Intentional error in bounce handler");
        } catch(error) {
            // On catching the error, update contract state
            self.balance = 100;
        }
    }
}

// The following is an example of duplicate bounce handlers for the same message type, which should be rejected by the compiler.
message Empty {}

contract DuplicateBounce {
    bounced(msg: bounced<Empty>) {
        // First (and only allowed) bounce handler for Empty
    }
    // Uncommenting the below duplicate receiver should cause a compilation error
    // bounced(msg: bounced<Empty>) {
    //     // Second bounce handler for Empty
    // }
}

// Example showing bounce receiver with a message that has a field exceeding the allowed size for bounced messages.
// Here we do not access the oversized field to avoid compilation errors.
message BigMsg {
    // Using default Int type might exceed 224 data bits if accessed
    data: Int;
}

contract BounceBigMsg {
    bounced(msg: bounced<BigMsg>) {
        // Avoid accessing msg.data to prevent exceeding the 224 data bits limitation
    }
}
