message MyMessage {
    value: Int;
}

contract BounceReceiver1 {
    bounced(msg: bounced<MyMessage>) {
        // no operation
    }
}
