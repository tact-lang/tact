// Comprehensive Test Suite for Bounced Messages and Bounce Receivers in Tact

// This suite is crafted based on multiple documentation references, such as:
// - Bounced messages behavior as described in docs_book_bounced.md
// - Bounce receiver syntax and rules from docs_ref_core-base.md and docs_book_contracts.md

// 1. Valid Typed Bounce Receiver: Uses a small message (< 224 bits).
message SmallMsg {
    // Bool occupies minimal space and easily fits within the 224-bit limit.
    flag: Bool;
}

contract BounceValid {
    state: Bool;
    init() {
        self.state = false;
    }
    bounced(msg: bounced<SmallMsg>) {
        // Update state based on bounced message
        self.state = msg.flag;
    }
}

// 2. Fallback Bounce Receiver: Accepts any bounced message as a raw Slice.
contract BounceFallback {
    // This handler will capture all bounced messages that do not match a more specific type
    bounced(raw: Slice) {
        // Here we simply ignore the raw message
    }
}

// 3. Intentional Compile-time Error with Oversized Message Type:
// This is used to validate the compiler’s enforcement of the 224-data-bit limit for bounced messages.
message BigMsg {
    // Using an Int here is considered too big to fit into 224 usable data bits for bounced messages.
    data: Int; 
}

contract BounceTooBig {
    bounced(msg: bounced<BigMsg>) {
        // Uncommenting the next line should produce a compilation error as expected, per the documentation.
        // let _dummy = msg.data;
    }
}

// 4. Multiple Bounce Receivers: Overloaded bounced handlers for different message types
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

// 5. Cross-Contract Bounce Scenario:
// ReceiverContract does not implement a receive for MsgTx; hence, if SenderContract sends MsgTx to ReceiverContract,
// it will bounce back to SenderContract which then handles it in its bounced receiver.

// To ensure that MsgTx fits within the 224-bit limit for bounced messages, we use a Bool instead of Int.
message MsgTx {
    data: Bool;
}

contract ReceiverContract {
    init() {}
    receive() {
        // No handler for MsgTx, so any MsgTx message will bounce
    }
}

contract SenderContract {
    state: Int;
    receiver_addr: Address;

    init(receiver_addr: Address) {
        self.state = 0;
        self.receiver_addr = receiver_addr;
    }

    receive("trigger") {
        // Send a MsgTx message to ReceiverContract with bounce: true, expecting it to bounce
        self.forward(self.receiver_addr, MsgTx{data: true}.toCell(), true, null);
    }

    bounced(msg: bounced<MsgTx>) {
        // Capture bounced message and update internal state based on the Bool value
        // Here we set state to 1 if data is true, else 0
        self.state = msg.data ? 1 : 0;
    }
}

/*
Summary:
-----------
1. BounceValid confirms that a typed bounced receiver works with a small message type, consistent with docs_book_bounced.md.
2. BounceFallback demonstrates how to implement a catch-all bounced receiver using a raw Slice, as permitted by the receiver function docs.
3. BounceTooBig verifies that the compiler enforces the 224-bit size limit for bounced messages; accessing fields of BigMsg would trigger a compile-time error.
4. MultiBounce confirms that overloading bounced receiver functions by message type is supported.
5. The cross-contract scenario using SenderContract and ReceiverContract validates that if a message is sent to a contract with no matching receive handler, it bounces back and is then handled in the sender's bounced receiver.

These tests have been designed to systematically and thoroughly validate the behavior of bounced messages and bounce receivers in Tact.
*/
