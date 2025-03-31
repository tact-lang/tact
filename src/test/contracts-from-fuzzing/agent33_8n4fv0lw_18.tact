message MyMessage {
    val: Int;
}

contract DuplicateBounce {
    bounced(msg: bounced<MyMessage>) {
        // First bounced receiver
    }
    bounced(raw: Slice) {
        // Duplicate bounced receiver
    }
}
