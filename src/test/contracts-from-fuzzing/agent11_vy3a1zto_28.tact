/*
Fuzz-Test: Comprehensive Receiver Functionality Edge Cases (Updated)
This file contains multiple contracts to test various subtle and edge-case behaviors of receiver functions in Tact.

Tested features include:
1. A contract with multiple receivers (for empty messages, specific string-based messages, messages with String parameter, a custom message type, and a fallback raw receiver).
2. A contract that sends multiple outbound messages in one receiver.
3. A receiver that uses try-catch to handle an arithmetic error (dividing by zero computed at runtime via dynamic context value).
4. A trait defining a receiver (using BaseTrait) and a contract using that trait along with its own receiver.
5. A contract with an external receiver.

None of these tests duplicate known documented issues; they explore less common combinations.
*/

// Custom message type (ensuring it fits within bounced message size limits by having a small field)
message MyMessage {
    value: Int as uint8;
}

// Contract with multiple receivers
contract MultiReceiver {
    // 1. Default receiver for an empty message
    receive() {
        // No operation
    }

    // 2. Receiver triggered by the specific string "hello"
    receive("hello") {
        self.reply("hello reply".asComment());
    }

    // 3. Receiver for any String message
    receive(str: String) {
        self.notify("string received".asComment());
    }

    // 4. Receiver for a custom message type MyMessage
    receive(msg: MyMessage) {
        self.reply("custom message".asComment());
    }

    // 5. Fallback raw receiver for any unmatched message (Slice)
    receive(msg: Slice) {
        self.notify("fallback receiver triggered".asComment());
    }
}

// Contract that sends multiple outbound messages in one receiver
contract MultipleSends {
    receive() {
        // First message sent via reply
        self.reply("first message".asComment());
        // Second message sent via forward to the sender
        self.forward(sender(), "second message".asComment(), true, null);
    }
}

// Contract with a receiver that uses try-catch to handle an error (division by zero)
contract TryCatchReceiver {
    receive() {
        // Use a dynamic value from context to avoid compile-time constant evaluation
        let x: Int = context().value;
        // Compute denominator dynamically. (x - x) will be 0 at runtime, but is not a compile-time constant
        let denom: Int = x - x;
        try {
            // This should trigger a runtime division-by-zero error
            let a = 42 / denom;
        } catch(error) {
            // On catching the error, reply with a comment
            self.reply("caught division by zero".asComment());
        }
    }
}

// Define a trait that implements a receiver for the string "ping"; note that we include BaseTrait
trait SampleTrait with BaseTrait {
    receive("ping") {
        self.reply("ping from trait".asComment());
    }
}

// Contract that uses the trait SampleTrait and defines an additional receiver for "greet"
contract TraitReceiver with SampleTrait {
    receive("greet") {
        self.reply("greet from contract".asComment());
    }
}

// Contract with an external receiver (no sender available)
contract ExternalReceiver {
    external("hi") {
        self.notify("hi external".asComment());
    }
}
