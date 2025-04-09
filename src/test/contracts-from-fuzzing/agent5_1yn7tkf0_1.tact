message MyMessage {
    value: Int;
}

contract BasicBounce {
    // Bounce receiver handling bounced messages of type MyMessage
    bounced(msg: bounced<MyMessage>) {
        // do nothing, just a minimal implementation
    }

    // A dummy receive function for completeness
    receive() {
    }
}
