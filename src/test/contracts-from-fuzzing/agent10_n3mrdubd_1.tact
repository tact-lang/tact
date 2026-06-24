message MyMessage {
    value: Int;
}

contract BounceTest {
    bounced(msg: bounced<MyMessage>) {
        // Handle bounced message
    }
}
