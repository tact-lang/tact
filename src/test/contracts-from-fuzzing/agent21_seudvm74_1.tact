message MyMessage {
    value: Int;
}

contract BounceTest {
    bounced(msg: bounced<MyMessage>) {
        // handling bounced message
    }
}
