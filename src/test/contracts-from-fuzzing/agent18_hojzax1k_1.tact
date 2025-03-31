message MyMessage {
    content: Int;
}

contract BounceTest {
    // Standard bounced receiver accepting a bounced message of type MyMessage
    bounced(msg: bounced<MyMessage>) {
        // Handling bounced message
    }
}
