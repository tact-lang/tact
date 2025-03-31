// We begin by testing basic bounce receiver functionality for typed bounced messages and fallback handling.

// Test 1: Minimal typed bounce receiver that simply receives a bounced message of a type MsgA
// The type MsgA is defined with a small field (8-bit) so that it fits within the 224-bit limit.

message MsgA {
    data: Int as uint8; // 8-bit unsigned integer to ensure it fits within bounce size restrictions
}

contract MultiBounceSm {
    // Typed bounce receiver for MsgA
    bounced(msg: bounced<MsgA>) {
        let x = msg.data; // Access the bounced data
    }

    // Fallback bounce receiver that catches any bounced message that doesn't match a typed receiver
    bounced(rawMsg: Slice) {
        // Fallback handling (could log, ignore, or process further)
    }
}

// Test 2: Recursive bouncing scenario across two contracts A and B.
// Contract A sends a MsgB message to its partner, and its bounce receiver increases a counter and forwards a bounce indication back.
// Contract B implements a fallback bounce receiver that when receiving any bounced message forwards it back to its partner.

message MsgB {}

contract A {
    partner: Address;
    counter: Int;

    init(partner: Address) {
       self.partner = partner;
       self.counter = 0;
    }

    // Typed bounce receiver for MsgB bounce messages
    bounced(msg: bounced<MsgB>) {
       // Increase counter upon bounce
       self.counter = self.counter + 1;
       // Forward bounce message to the partner contract
       self.forward(self.partner, "bounce from A".asComment(), true, null);
    }

    receive() {
       // Send a message of type MsgB with bounce flag enabled
       send(SendParameters{
         bounce: true,
         to: self.partner,
         value: 0,
         body: MsgB{}.toCell()
       });
    }
}

contract B {
    partner: Address;

    init(partner: Address) {
       self.partner = partner;
    }

    // Fallback bounce receiver for any bounced message
    bounced(rawMsg: Slice) {
       // Forward bounce message back to the partner contract
       self.forward(self.partner, "bounce from B".asComment(), true, null);
    }

    receive() {}
}
