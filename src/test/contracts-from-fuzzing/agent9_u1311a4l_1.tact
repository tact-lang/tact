message MyMessage {
    value: Int;
}

contract TestBounce1 {
    // Standard bounced receiver receiving bounced message of type MyMessage
    bounced(msg: bounced<MyMessage>) {
        // example action: no state, just a comment
        // In a real scenario, you might use msg.value...
    }
}
