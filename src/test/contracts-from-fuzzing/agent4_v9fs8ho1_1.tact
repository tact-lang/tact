message MyMessage {
    value: Int;
}

contract TestBounce {
    // Bounced message receiver with a typed message. According to documentation, bounced receivers should be defined with parameter type bounced<T>.
    bounced(msg: bounced<MyMessage>) {
        // Minimal implementation to test bounce receiver
        // The message should be processed when a bounced message is received (even though nothing is done here)
    }
}
