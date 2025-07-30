message MyMessage {
    counter: Int;
}

contract BounceReceiver3 {
    bounced(_ : bounced<MyMessage>) {
        // No operation
    }
}
