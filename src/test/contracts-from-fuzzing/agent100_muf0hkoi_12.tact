message MyMessage {
    value: Int;
}

contract TestBounced {
    bounced(msg: bounced<MyMessage>) {
        // Handle bounced message of type MyMessage
    }
}
