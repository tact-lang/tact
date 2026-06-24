message SomeMsg {
    value: Int;
}

contract BounceMismatch {
    // bounced message receiver expecting a structured SomeMsg payload
    bounced(msg: bounced<SomeMsg>) {
        // Attempt to decode and do something with the value
        // but we'll leave it empty for testing
    }

    // trigger function which sends a bounceable message with an incorrect body
    receive("trigger") {
        // Intentionally sending a message that is not a cell containing SomeMsg data
        // This should be caught at runtime, but at compile time the type is not checked
        send(SendParameters{
            to: sender(),
            value: 0,
            bounce: true,
            mode: SendRemainingValue,
            // Sending wrong type; using a comment cell instead of SomeMsg encoded cell
            body: "Wrong payload".asComment()
        });
    }
}
