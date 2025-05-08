message Msg {
    dummy: Int;
}

contract BounceDuplicate {
    // First bounce receiver
    bounced(msg: bounced<Msg>) {
        // Handler 1
    }

    // Duplicate bounce receiver, should trigger an error because only one bounce receiver is allowed
    bounced(raw: Slice) {
        // Handler 2
    }
}
