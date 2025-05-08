message MyMessage {
    content: Int;
}

contract BounceContract {
    bounced(msg: bounced<MyMessage>) {
        // Dummy processing to satisfy the syntax
        return;
    }
}
