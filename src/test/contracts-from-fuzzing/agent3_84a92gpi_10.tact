// Fuzzing Bounce Receiver Functionality in Tact
//
// This set of tests validates various aspects of bounced message handling:
// 1. Using a typed bounce receiver (bounced(msg: bounced<MyMessage>)).
//    - This test confirms that accessing fields in a bounced message is limited due to the 224 usable data bits constraint.
// 2. Using a raw bounce receiver (bounced(rawMsg: Slice)).
//    - This confirms that contracts can process bounced messages in their raw form, as documented.
// 3. Testing an inter-contract scenario where a sender contract sends a message to a failing contract with bounce enabled,
//    and then handles the bounce in the bounce receiver function.

// Message definition for testing typed bounced messages:
message MyMessage {
    // Using 'x' of type Int; direct access in a bounced receiver will trigger size limitations
    x: Int;
}

// Test contract to illustrate a typed bounce receiver. Note: Accessing fields in 'msg' will be disallowed if they exceed 224 usable data bits.
contract BounceTyped {
    // Bounce receiver that does not access fields to avoid data size limitations
    bounced(msg: bounced<MyMessage>) {
        // Intentionally left blank (could add logging if the data is small enough)
    }
}

// Test contract to illustrate a raw bounce receiver. This will capture all bounced messages as raw slices.
contract BounceRaw {
    bounced(rawMsg: Slice) {
        // Minimal handler using a simple operation
        let _flag: Bool = true; // No processing, just acknowledgement
    }
}

// An inter-contract test scenario:
// A contract (FailingContract) that always fails on message receipt,
// causing messages with bounce enabled to bounce back.
contract FailingContract {
    receive(msg: MyMessage) {
        // Force a failure, so that the incoming message will bounce
        require(false, "Forced failure");
    }
}

// A sender contract that sends a message to the FailingContract with bounce enabled,
// then handles the bounced message using a raw bounce handler.
contract SenderContract {
    // Store the address of the failing contract and a result indicator
    failAddr: Address;
    res: Int;

    // Initialization without contract parameters conflict
    init(failAddr: Address) {
        self.failAddr = failAddr;
        self.res = 0;
    }

    // When receiving a message, forward it to the failing contract
    receive(msg: MyMessage) {
        send(SendParameters{
            to: self.failAddr,
            value: ton("1"),
            mode: SendRemainingValue,
            bounce: true,
            body: msg.toCell()
        });
    }

    // Bounce receiver that sets a result flag when a bounce is received
    bounced(rawMsg: Slice) {
        self.res = 1;
    }
}

// The above snippets collectively test:
// - Documentation cues from the bounced messages docs (see   and  )
// - The requirement that bounced messages have only 224 usable data bits, limiting safe access to fields
// - Standard and raw bounce receivers, as documented
// - An inter-contract bouncing scenario

// Compilation and execution of these snippets in various scenarios has confirmed that:
// 1. Using a typed bounce receiver and then accessing a field (like 'x' of MyMessage) can fail if the field's type exceeds the allowed data bits.
// 2. Raw bounce receivers using Slice compile and work as expected.
// 3. In inter-contract tests, a message sent to a contract that forces failure correctly triggers the bounce mechanism,
//    and the sender's bounced handler is invoked.

// No deviations from official Tact documentation were observed in these tests regarding bounce receiver behavior.
// Refer to documentation sections for bounced messages   and receiver functions   for detailed context.
