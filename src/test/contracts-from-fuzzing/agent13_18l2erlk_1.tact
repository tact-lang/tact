message MyMessage {
    data: Int;
}

contract StandardBounce {
    bounced(msg: bounced<MyMessage>) {
        // Standard typed bounced receiver
    }
}
